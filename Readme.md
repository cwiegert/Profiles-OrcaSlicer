 Profiles for printers, filaments and processes 

kept up to date and synched through rsync on the home mac, and autocommited to git

01/14/2025

Step-by-Step: Run sync_orca_git.sh as a Launch Agent

1. ✅ Make sure the script is executable
If it’s not already executable:
```
chmod +x /path/to/sync_orca_git.sh
```

2. ✅ Create a LaunchAgent .plist file
Create a new plist file in ~/Library/LaunchAgents/ (this runs it only for your user)
```
nano ~/Library/LaunchAgents/com.user.sync_orca_git.plist
```
Paste the following contents (update the paths accordingly):

<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
"http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>com.user.sync_orca_git</string>

    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>/path/to/sync_orca_git.sh</string>
    </array>

    <key>StartInterval</key>
    <integer>600</integer> <!-- Runs every 10 minutes (600 seconds) -->

    <key>RunAtLoad</key>
    <true/>

    <key>StandardOutPath</key>
    <string>/tmp/sync_orca_git.out</string>
    
    <key>StandardErrorPath</key>
    <string>/tmp/sync_orca_git.err</string>
</dict>
</plist>
3. ✅ Load the LaunchAgent
To load and run the script as a background service:

```
launchctl load ~/Library/LaunchAgents/com.user.sync_orca_git.plist
```
To have it run on every login and on the schedule, make sure this loads automatically by keeping it in ~/Library/LaunchAgents/.

4. 🔁 Manage the service
Start it manually:
```
launchctl start com.user.sync_orca_git
```
Stop it:
```
launchctl stop com.user.sync_orca_git
```
Unload it:
```
launchctl unload ~/Library/LaunchAgents/com.user.sync_orca_git.plist
```
