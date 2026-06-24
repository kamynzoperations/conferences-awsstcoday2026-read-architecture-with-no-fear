# From Junior to Architect: Read Infra Without Fear — AWS Student Day 2026

- 💼 [LinkedIn](https://www.linkedin.com/in/kamymartinez/)
- 🐦 [Instagram](https://www.instagram.com/kamynz/)

## Introduction

This repository contains everything needed to follow the demo for the talk **"Read Architecture with No Fear"** at **AWS Student Day 2026**. It holds the Terraform project used in the live demo and the step-by-step guides (English + Spanish) for visualizing infrastructure with **Terramaid** and **Terravision**.

## Relevant link

> 🔗 **Presentation**: TBD — link will be added once published.

## Audience

- Mixed/general conference audience, including attendees with no prior technical experience
- People who feel afraid or intimidated reading raw Terraform code
- Anyone who wants to learn to read cloud architecture through diagrams instead of `.tf` files

## Goals

- Introduction to reading AWS architectures through diagrams, without needing to read Terraform line by line
- Generate a Mermaid flowchart (Terramaid) from Terraform resources, with AI-applied styling
- Generate a PNG architecture diagram (Terravision) directly from Terraform source code

## Demo Scenario

> TBD

## Summary

| **Goals**          | *See Goals section above*                                                      |
| ------------------- | -------------------------------------------------------------------------------- |
| **What you'll learn** | *Using Terramaid and Terravision to visualize Terraform infrastructure*       |
| **What you'll need** | *Terraform, Python, Git, and Graphviz installed (see Prerequisites)*           |
| **Topics**          | *Terraform, Terramaid, Terravision, Mermaid*                                    |
| **Slides**          | TBD                                                                              |

## Relevant prerequisites

- Have Terramaid and Terravision installed along with their dependencies (Python 3.10+, Git, Graphviz, Terraform) — see [`step1-installation-english.md`](./step1-installation-english.md)
- Have access to the demo project [`tf-demo-repo/`](../tf-demo-repo)

## Repository structure

```
.
├── step1-installation-english.md                  # Step 1 (English) — install Terramaid & Terravision
├── step2-check-prompt-for-terramaid-english.md     # Step 2 (English) — review the Mermaid styling prompt
├── step3-run-terramaid-and-terravision-english.md  # Step 3 (English) — run both tools on tf-demo-repo
├── tf-demo-repo/                                  # Terraform project used for the live demo
│   ├── *.tf                                       # Source infrastructure (ALB, ECS, RDS, networking, etc.)
│   └── results/                                   # Generated Terramaid/Terravision output (see Workflows below)
```

The demo walks through `tf-demo-repo/` specifically. Steps are numbered and mirrored across both languages; follow the set that matches your language.

## Workflows

Two GitHub Actions workflows turn locally generated diagrams into a reviewable PR:

| Workflow | File | Watches for |
|---|---|---|
| Commit Terramaid Results | `.github/workflows/terramaid-results.yml` | `*_tm_style-*.mmd` |
| Commit Terravision Results | `.github/workflows/terravision-results.yml` | `*_tv_*.png` |

**Trigger:**
- Automatically on push to `main` when any `**.tf` file changes, or
- Manually, at any time, via `workflow_dispatch`.

**What it does:** finds the matching generated files anywhere in the repo, moves them into the nearest `tf-*/results/` folder, and opens a pull request against `main` with the changes.

**Running manually:**
1. Go to the **Actions** tab on GitHub.
2. Select either "Commit Terramaid Results" or "Commit Terravision Results" from the left sidebar.
3. Click **Run workflow** → choose the `main` branch → **Run workflow**.
4. Once it completes, review the opened PR and merge it.

## Video

> TBD

## Pre-Learning

> TBD

## Learnings, and next steps

> TBD

## Acknowledgments

TBD
