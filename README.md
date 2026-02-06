# mac-bootstrap

A **modular, idempotent, dry-run-safe macOS bootstrap system** for setting up a developer workstation on Apple Silicon Macs.

This project is intentionally opinionated. It reflects how _I_ expect a usable development machine to behave — reproducible, boring, and free of legacy cruft.

If you’re looking for a one-file “install everything” script, this is not that.
If you want something you can **run, re-run, inspect, and trust**, you’re in the right place.

---

## Goals

- ✅ Safe to re-run
- ✅ No interactive prompts
- ✅ Dry-run support (no side effects)
- ✅ Apple Silicon–native
- ✅ Modular and readable
- ✅ No secrets committed to Git

---

## Non-Goals

- ❌ No UI automation hacks
- ❌ No plist surgery beyond supported defaults
- ❌ No system Python modification
- ❌ No encrypted secrets in the repo
- ❌ No “magic” behavior

---

## How It Works

The system is organized as **independent modules**, each responsible for a single concern:

```text
mac-bootstrap/
├── bootstrap.sh          # entry point
├── config.sh             # flags + identity
├── brew/                 # Homebrew + Brewfile
├── python/               # Python CLI tooling via pipx
├── ssh/                  # SSH key setup/import
├── git/                  # Git global configuration
├── macos/                # macOS defaults + Dock layout
├── repos/                # Optional repo cloning
└── lib/                  # shared helpers (logging, dry-run)
```

````

The top-level `bootstrap.sh` acts as a **declarative orchestrator**.
All real work happens inside modules.

---

## Dry Run Mode (Important)

By default, the system runs in **dry-run mode**.

This means:

- No software is installed
- No files are modified
- No keys are generated
- No macOS settings are changed

Instead, the script prints **exactly what it would do**.

To enable real execution, edit `config.sh`:

```bash
DRY_RUN=false
```

Dry run is enforced centrally — if `DRY_RUN=true`, no module is allowed to mutate state.

---

## Configuration

All behavior is controlled via flags in `config.sh`.

Example:

```bash
DRY_RUN=true

INSTALL_BREW=true
INSTALL_PYTHON=true
RESTORE_SSH=true
CONFIGURE_GIT=true
CONFIGURE_MACOS=true
CONFIGURE_DOCK=true
```

The philosophy is simple:

> If something can change system state, it must be flag-controlled.

---

## Homebrew

Homebrew packages and applications are declared in a `Brewfile`.

- CLI tools
- GUI apps
- Media tooling (e.g. ffmpeg, imagemagick)

Install logic lives in `brew/brew.sh`.

The Brewfile is treated as **documentation**, not just configuration.

---

## Python Tooling (pipx)

Python command-line tools are installed using **pipx**, not global `pip`.

This keeps:

- CLI tools isolated
- Dependencies conflict-free
- System Python untouched

Examples:

- `black`
- `ruff`
- `ipython`
- `poetry`
- `pre-commit`

Libraries meant to be _imported_ (numpy, pandas, etc.) are intentionally excluded and should be installed per-project in virtual environments.

---

## SSH Keys

The SSH module supports three safe states:

1. Existing key present → leave it alone
2. External key directory present → import keys
3. No key found → generate a new ed25519 key

No private keys are stored in this repository.

---

## Git Configuration

Global Git settings are applied deterministically:

- User identity
- Default branch (`main`)
- Credential helper
- Editor configuration

All Git mutations respect dry-run mode.

---

## macOS Defaults

Only **modern, supported, ergonomic defaults** are applied.

This includes:

- Finder behavior
- Keyboard repeat
- Screenshot location
- Dock behavior (not layout)

Legacy tweaks, deprecated flags, and fragile plist hacks are intentionally excluded.

---

## Dock Layout

Dock layout is managed using `dockutil`.

The Dock is:

- Cleared
- Rebuilt in a deterministic order
- Grouped logically

Spaces are **not** created programmatically.
Instead, automatic rearranging is disabled so manual Space assignments remain stable.

---

## Usage

```bash
./bootstrap.sh
```

Run it once to inspect behavior (dry run).
Flip `DRY_RUN=false` when you’re ready to apply changes.

You can safely re-run the script at any time.

---

## Why This Exists

After years of copy-pasting installer scripts, the goal here is simple:

> Make machine setup boring, predictable, and reviewable.

This project favors:

- clarity over cleverness
- reproducibility over convenience
- explicit behavior over automation tricks

---

## License

MIT (or add one if you want)

---
````
