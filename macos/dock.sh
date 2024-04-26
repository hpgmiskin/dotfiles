#!/bin/sh

echo "Remember to add Google Calendar Flotato app first !!"

dockutil --no-restart --remove all

dockutil --no-restart --add "/Applications/1Password 7.app"
dockutil --no-restart --add "/Applications/Alfred 4.app"
dockutil --no-restart --add "/Applications/balenaEtcher.app"
dockutil --no-restart --add "/Applications/Arc.app"
dockutil --no-restart --add "/Applications/Cyberduck.app"
dockutil --no-restart --add "/Applications/Superhuman.app"
dockutil --no-restart --add "/Applications/Cron.app"
dockutil --no-restart --add "/Applications/Insomnia.app"
dockutil --no-restart --add "/Applications/iTerm.app"
dockutil --no-restart --add "/Applications/Notion.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Spotify.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/zoom.us.app"
dockutil --no-restart --add "/System/Applications/App Store.app"
dockutil --no-restart --add "/System/Applications/System Preferences.app"
dockutil --no-restart --add "/System/Applications/Utilities/Activity Monitor.app"
dockutil --no-restart --add "/System/Applications/Utilities/Console.app"

killall Dock
