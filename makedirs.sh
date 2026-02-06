touch bootstrap.sh          # entry point (run this)
touch config.sh             # identity + feature flags

mkdir -p brew
touch brew/Brewfile         # ALL brew + casks
touch brew/brew.sh

mkdir -p python
touch python/python.sh

mkdir -p macos
touch macos/defaults.sh     # sane macOS tweaks
touch macos/dock.sh         # dock + spaces (your obsession 😄)

mkdir -p ssh
touch ssh/ssh.sh

mkdir -p git
touch git/git.sh

mkdir -p repos
touch repos/repos.sh

mkdir -p lib
touch lib/logging.sh

chmod +x bootstrap.sh \
brew/brew.sh \
python/python.sh \
macos/defaults.sh \
macos/dock.sh \
ssh/ssh.sh \
git/git.sh \
repos/repos.sh

cat <<EOF > .gitignore
.DS_Store
.idea/
.vscode/
*.log
EOF
