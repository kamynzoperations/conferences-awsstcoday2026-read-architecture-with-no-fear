# Step 3 — Run Terramaid & Terravision

## Overview

This step visualizes the Terraform infrastructure from the demo repository using two complementary tools:

- **Terramaid** → generates a Mermaid flowchart from Terraform resource relationships, then applies AI-powered styling via Claude.
- **Terravision** → renders a PNG cloud architecture diagram directly from Terraform source files.

---

## 1. Clone the Repository

**Why:** You need the source Terraform files and the Mermaid styling prompt to run both tools.

```bash
git clone https://github.com/kamynzoperations/conferences-awsstcoday2026-read-architecture-with-no-fear.git
```

---

## 2. Run Terramaid on `tf-demo-repo`

**Why:** Terramaid parses your Terraform plan or configuration and converts resource dependencies into a Mermaid diagram — making the architecture readable without touching the cloud console.

**What you'll produce:** A raw Mermaid flowchart file (`00_tm_demo-repo.mmd`) and a styled version (`01_tm_style-demo-repo.mmd`).

### 2a. Navigate to the Terraform directory

```bash
cd tf-demo-repo
```

### 2b. Generate the raw Mermaid diagram

**Why:** This command scans the Terraform resources in the current directory and outputs a left-to-right flowchart in Mermaid format.

```bash
terramaid run \
  -o 00_tm_demo-repo.mmd \
  -r "LR" \
  -s "00_tm_demo-repo" \
  -c "flowchart"
```

| Flag | Meaning |
|------|---------|
| `-o` | Output filename |
| `-r` | Direction: `LR` = Left to Right |
| `-s` | Diagram subtitle / label |
| `-c` | Chart type (`flowchart`) |

**Expected output:** `00_tm_demo-repo.mmd`

### 2c. Apply AI styling with Claude

**Why:** The raw Mermaid output is functional but unstyled. The prompt in `MERMAID_STYLING_PROMPT_UPDATED.md` instructs Claude to apply AWS-themed colors, icons, and layout improvements.

**How:**

1. Open a terminal and launch Claude Code from the `tf-demo-repo` directory:

    ```bash
    claude
    ```

2. Confirm your working directory inside Claude:

    ```
    pwd
    ```

3. Run the following prompt in Claude:

    ```
    Use the prompt in ../MERMAID_STYLING_PROMPT_UPDATED.md on the file 00_tm_demo-repo.mmd
    and generate the output as 01_tm_style-demo-repo.mmd with title "AWS Terraform Overview".
    ```

**Expected output:** `01_tm_style-demo-repo.mmd` — a styled, presentation-ready Mermaid diagram.

---

## 3. Run Terravision on `tf-demo-repo`

**Why:** Terravision produces a visual cloud architecture diagram from the same Terraform source — useful for stakeholders who prefer infrastructure diagrams over flowcharts.

**How:** Open a **separate terminal window** (keep the Claude session open if still in use), then run:

```bash
terravision draw \
  --source . \
  --format png \
  --outfile 00_tv_demo-repo-aws_architecture
```

| Flag | Meaning |
|------|---------|
| `--source` | Path to Terraform files (`.` = current directory) |
| `--format` | Output image format (`png`) |
| `--outfile` | Output filename (no extension needed) |

**Expected output:** `00_tv_demo-repo-aws_architecture.png`

---

## Optional — Run Terramaid on `tf-aws-account-storage`

> Follow the same steps as Section 2, substituting `tf-aws-account-storage` as the working directory and updating the output filenames accordingly.

