# Step 1 — Installation

This step installs the two tools used to visualize Terraform infrastructure:

- **Terramaid** — converts Terraform resource graphs into Mermaid flowcharts
- **Terravision** — renders cloud architecture diagrams as PNG images from Terraform source

---

## Part 1 — Install Terramaid

**Why:** Terramaid reads your Terraform configuration and produces a Mermaid diagram of resource relationships. It must be installed before running the visualization commands in Step 3.

Reference: [github.com/RoseSecurity/Terramaid](https://github.com/RoseSecurity/Terramaid)

---

### macOS (recommended)

```bash
brew install terramaid
which terramaid   # confirm the binary is on your PATH
```

---

### Windows

Choose the option that best matches your environment:

#### Option 1 — Pre-built binary (easiest, no dependencies)

1. Go to [github.com/RoseSecurity/Terramaid/releases](https://github.com/RoseSecurity/Terramaid/releases)
2. Download the ZIP for your architecture:
   - `Terramaid_Windows_x86_64.zip` — most 64-bit PCs
   - `Terramaid_Windows_arm64.zip` — ARM-based Windows devices
3. Extract the ZIP and move `terramaid.exe` to a folder on your `PATH`
   (e.g. `C:\tools\` added to PATH, or `C:\Windows\System32`)
4. Verify:
   ```
   terramaid --help
   ```

#### Option 2 — Go install (if Go is already set up)

```bash
go install github.com/RoseSecurity/terramaid@latest
```

This places the binary in `GOPATH/bin`, which is typically already on your PATH.

#### Option 3 — Build from source

```bash
git clone git@github.com:RoseSecurity/terramaid.git
cd terramaid
make build
```

> Requires `make` on Windows — available via Git Bash, WSL, or
> [GnuWin32](http://gnuwin32.sourceforge.net/packages/make.htm).

---

## Part 2 — Install Terravision

**Why:** Terravision generates PNG cloud architecture diagrams directly from Terraform source files. It requires Python and Graphviz in addition to the CLI itself.

Reference: [Terravision Installation Guide](https://github.com/patrickchugh/terravision/blob/main/docs/installation.md)

---

### Step 2a — System Requirements

| Dependency | Required | Notes |
|---|---|---|
| Python 3.10+ | ✅ Yes | Core runtime |
| Git | ✅ Yes | Source fetching |
| Graphviz | ✅ Yes | Diagram rendering |
| Terraform 1.x | ⚠️ Conditional | Not needed if using `--planfile` mode |
| Ollama | ❌ Optional | Only for local AI diagram refinement |
| wslu | ❌ Optional | WSL only — needed for `--show` to auto-open diagrams |

> If you supply pre-generated outputs via `--planfile` and `--graphfile`,
> Terraform itself is not required. See the Usage Guide for details.

---

### Step 2b — Install Dependencies

#### Graphviz

```bash
# macOS
brew install graphviz

# Ubuntu / Debian
sudo apt install graphviz

# Windows — download installer from https://graphviz.org/download/
```

#### Git

Most systems have Git pre-installed. Verify with:

```bash
git --version
```

#### Terraform (if not using `--planfile` mode)

```bash
# macOS
brew tap hashicorp/tap
brew install hashicorp/terraform

# Windows — download from https://developer.hashicorp.com/terraform/install
```

---

### Step 2c — Install Terravision CLI

**Why:** `pipx` installs Terravision into an isolated environment so it does not conflict with other Python packages on your system.

```bash
# Install pipx first if you don't have it:
#   macOS:          brew install pipx && pipx ensurepath
#   Ubuntu/Debian:  sudo apt install pipx && pipx ensurepath
#   Windows:        python -m pip install --user pipx && python -m pipx ensurepath

pipx install terravision
```

---

## Final Verification

Run the following to confirm both tools and all dependencies are correctly installed:

```bash
# Terramaid
which terramaid
terramaid --help

# Terravision
terravision --version
terravision --help

# Dependencies
python --version     # expect 3.10+
git --version
dot -V               # Graphviz
terraform version    # skip if using --planfile mode
```

All commands should return version output without errors. If any fail, revisit the relevant installation section above before proceeding to Step 2.