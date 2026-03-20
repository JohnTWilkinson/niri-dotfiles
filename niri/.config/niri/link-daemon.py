import subprocess
import json

class Workspace:
    id: int
    index: int
    output: str

    def __init__(self, id, index, output):
        self.id = id
        self.index = index
        self.output = output

    def __str__(self):
        return f"Workspace {self.id}: {self.index}, {self.output}"

    def __repr__(self):
        return self.__str__()


def niri_event_stream():
    process = subprocess.Popen(
            ["niri", "msg", "-j", "event-stream"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            bufsize=1
    )

    try:
        for line in process.stdout:
            line = line.strip()
            if not line:
                continue

            try:
                event = json.loads(line)
                yield event
            except json.JSONDecodeError:
                print("Error parsing line")

    finally:
        process.stdout.close()
        process.wait()

        if process.returncode != 0:
            error = process.stderr.read()
            raise RuntimeError(f"Command failed (exit {process.returncode}): {error}")

def update_workspaces(json):
    workspaces = {}
    active_workspaces = {}

    
    for workspace in json["workspaces"]:
        id = workspace["id"]
        idx = workspace["idx"]
        output = workspace["output"]
        active = workspace["is_active"]

        workspaces[id] = Workspace(id, idx, output) 
        if active:
            active_workspaces[output] = idx

    return (workspaces, active_workspaces)

# Maps output -> [ index -> id ]
def update_outputs(workspaces: dict[int, Workspace]):
   outputs: dict[str, list[int]] = {}

   for workspace in workspaces.values():
       if workspace.output not in outputs:
           outputs[workspace.output] = [] 

       outputs[workspace.output].insert(workspace.index, workspace.id)

   return outputs

def focus_monitor(name):
    subprocess.run(
            ["niri", "msg", "action", "focus-monitor", name]
    )

def get_focused_monitor():
    return json.loads(subprocess.run(
            ["niri", "msg", "-j", "focused-output"],
            capture_output=True,
            text=True,
    ).stdout)["name"]


def activate_workspace(idx):
    subprocess.run(
            ["niri", "msg", "action", "focus-workspace", idx.__str__()]
    )

def activate_workspace_on(idx, monitor):
    current_monitor = get_focused_monitor() 
    focus_monitor(monitor)
    activate_workspace(idx)
    focus_monitor(current_monitor)


def print_workspaces(workspaces):
    print("Workspaces:")
    for workspace in workspaces.values():
        print("    ", workspace)

    print()

def print_active_workspaces(active_workspaces: dict[str, int]):
    print("Active:")
    for output, workspace in active_workspaces.items():
        print("    ", output, " :  ", workspace)
    
    print()

def print_outputs(outputs):
    for output, workspaces in outputs.items():
        print(output)

        for index, id in enumerate(workspaces):
            print("   ", index, " ->  ", id)

links: list[list[str]] = [["eDP-1", "HDMI-A-1"]]
# links = [[]]
workspaces: dict[int, Workspace] = {}
outputs: dict[str, list[int]]
active_workspaces: dict[str, int] = {} # Maps output name to workspace id

for event in niri_event_stream():
    '''
        LARGE WORKSPACES CHANGE
        for value in iterable:
            pass
    '''
    workspaces_change = event.get("WorkspacesChanged")
    if workspaces_change:
        workspaces, active_workspaces = update_workspaces(workspaces_change)
        outputs = update_outputs(workspaces)

        print_workspaces(workspaces)
        print_active_workspaces(active_workspaces)
        print_outputs(outputs)


    '''
        SINGLE WORKSPACE ACTIVATION
    '''
    workspace_activated = event.get("WorkspaceActivated")
    if workspace_activated:
        pivot_workspace = workspaces[workspace_activated["id"]]
        pivot_output = workspaces[pivot_workspace.id].output
        index = pivot_workspace.index

#        print("(" + pivot_workspace.__str__() + ")", pivot_output, index, sep=" | ")
#        print("Active:", active_workspaces[pivot_output]) 
        print("Active Workspace on", pivot_output, "changed to", index, "or", pivot_workspace)
        print("We think the active workspace is", active_workspaces[pivot_output])
        '''
            Check if workspace is already tracked as being focused
            (which means this event is from a link switch),
            skip if it is.

            Otherwise, set this workspace as active, and...

                Check every link to see if this workspace's monitor is linked

                    If it IS linked, then...
                        
                        Go through every other output in the link, set the
                        active workspace to be the current index.
        '''
        
        if active_workspaces[pivot_output] != index:
            print("MISMATCH! The user was responsible for this change\n")
        # if False:
            active_workspaces[pivot_output] = index
            
            for link in links:
                if pivot_output in link:
                    for output in link:
                        if output is not pivot_output:
                            activate_workspace_on(index, output)
                            active_workspaces[output] = index
        else:
            print("MATCH! We were responsible for this change or the user is just switching monitor focus\n")

