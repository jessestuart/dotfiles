on run argv
  --set appName to quoted form of (item 1 of argv)
  --set appID to bundle identifier of (info for (path to application appName))
  --tell application "System Events"
    --if not (exists process appName) then
      --tell application appID to activate
    --else
      --if frontmost of process appName then
        --set visible of process appName to false
      --else
        --set frontmost of process appName to true
      --end if
    --end if
  --end tell
  set appName to (item 1 of argv)
  set startIt to false
  tell application "System Events"
    if not (exists process appName) then
      set startIt to true
    else if frontmost of process appName then
      set visible of process appName to false
    else
      set frontmost of process appName to true
    end if
  end tell
  if startIt then
    tell application appName to activate
  end if
end run
