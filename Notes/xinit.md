Xquartz entry points:
- no launchd, /opt/X11/bin/Xquartz first
- no launchd, app bundle first
- with launchd, app bundle first
- with launchd, startx
- with launchd, xterm


xinit.m: replaces launchd_startx AND ALSO stub
- accepts /path/to/xinit as first argument
- accepts xinit arguments
- accepts startx arguments
- accepts launchd job sockets/management
- accepts messages from X.app for launching processes
- chdir(HOME)
- accepts server args as Xquartz
- creates sockets /tmp/.X11-unix/X0 based on args?
- GCD queues, XPC?
- also replace privileged_startx binary?
- reads bootstram_name/bundle_id/whatever from context: launchd, [NSBundle mainBundle], argv[0], &c.
- reads defaults for app_to_run, login_shell, startx_script, wm_path

X.app runs some of it's own clients...pbproxy...? so, clients never drop to zero? Deal with server_generation, whatever.

Should X.app incorporate xinit.m *interally* or launch as separate tool? Both (launchd or no-lonchd)?

defaults read org.Xquartz.X11 BackingStore, SaveUnders, Xinerama(?!?!?), GLX, iGLX, &c

X.app needs to deal with dropping to "zero" clients, where "zero" is defined as server client plus pbproxy plus XXX?








NSString* runShellCommand(NSString *command) {
    NSTask *task = [[NSTask alloc] init];
    task.environment = @{}; //If we don't reset this, launchd may try to inject QuickTimeFixer into our NSTask!
    [task setLaunchPath:@"/bin/sh"];
    [task setArguments:@[@"-c", command]];
    
    NSPipe *pipe = [[NSPipe alloc] init];
    NSFileHandle *fileHandle = [pipe fileHandleForReading];
    [task setStandardOutput:pipe];
    [task launch];
    [task waitUntilExit];
    
    NSData *data = [fileHandle readDataToEndOfFile];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
