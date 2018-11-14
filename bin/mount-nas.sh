#!/bin/bash
osascript <<EOD
tell application "Finder"
if not (disk "Time%20Machine%20NAS" exists) then
mount volume "smb://chezjaylilnas/Time%20Machine%20NAS"
end if
end tell
EOD
