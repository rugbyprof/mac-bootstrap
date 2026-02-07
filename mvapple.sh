# apps=(
#   "/System/Applications/Contacts.app"
#   "/System/Applications/Notes.app"
#   "/System/Applications/Maps.app"
#   "/System/Applications/Reminders.app"
#   "/Applications/Games.app"
#    "/System/Applications/Music.app"
#     "/System/Applications/TV.app"
#     "/System/Applications/FaceTime.app"
#   "/System/Applications/Phone.app"
# )

apps=(
   "/System/Applications/Mail.app"
    "/System/Applications/Photos.app"
)


for app in "${apps[@]}"; do
  osascript -e "tell application \"Finder\" to make alias file to POSIX file \"$app\" at POSIX file \"$HOME/Desktop/Apple_Apps\""
done