# README Spec

Parent goal: [[project-goal]]

## Purpose

Create a root `README.md` that orients a visitor coming from the conference talk: what this repo contains, where the live demo lives, where the talk itself can be found, and how the result-generating workflows work.

## Sections and decisions

### 1. Repo structure (demo-relevant only)

**Decision:** Document only the parts relevant to the demo segment — `tf-demo-repo/` and the step docs (Spanish + English) — per [[project-goal]]. Other folders (`tf-aws-account-storage/`, `before/`, `.DS_Store`, `notes.txt`, `MERMAID_STYLING_PROMPT_UPDATED.md`) are out of scope for detailed documentation; they may get at most a one-line mention.

**Decision:** Step docs are listed explicitly by filename, per language, not just described by pattern:

- Spanish (repo root):
  - `step1-installation-spanish.md`
  - `step2-check-prompt-for-terramaid-spanish.md`
  - `step3-run-terramaid-and-terravision-spanish.md`
- English (`steps_english_version/`):
  - `step1-installation-english.md`
  - `step2-check-prompt-for-terramaid-english.md`
  - `step3-run-terramaid-and-terravision-english.md`

**Decision:** `step4-compare-results-for-demo-repo-*.md` (English and Spanish) is **omitted** from the README — both are currently empty/unwritten. Re-add once it has content.

**Decision:** The demo Terraform project is `tf-demo-repo/` specifically (not `tf-aws-account-storage/`, which is optional/secondary per [[project-goal]]).

### 2. Presentation link

**Decision:** Add a clearly marked placeholder (e.g. `> 🔗 Presentation link: TBD`) since the talk isn't finalized/published yet. To be filled in once available.

### 3. Workflows (high level)

**Decision:** Explain, for both `.github/workflows/terramaid-results.yml` and `.github/workflows/terravision-results.yml`:

- **Trigger**: runs automatically on push to `main` when `**.tf` files change, OR can be triggered manually via `workflow_dispatch`.
- **What it does**: scans the repo for generated output (`*_tm_style-*.mmd` for Terramaid, `*_tv_*.png` for Terravision), moves matched files into the nearest `tf-*/results/` folder, and opens a PR against `main` with those results.
- **How to run manually**: via the GitHub Actions tab → select the workflow → "Run workflow" button (`workflow_dispatch`).

### 4. Baseline adaptation (from KamyNz/awscomunityday2023, `demo_spanish` branch)

**Decision:** `README.md` (Spanish) was restructured to follow the section pattern of the prior conference repo's baseline README, adapted to this project's content:

- **Social links** — added under the title (LinkedIn, Twitter), same URLs as baseline.
- **Audiencia** — added, framed per [[project-goal]] (mixed/general audience, people intimidated by reading raw Terraform).
- **Metas** — added (read AWS architecture via diagrams, generate Terramaid + Terravision outputs).
- **Resumen** (summary table) and **Prerequisitos** — added, adapted to Terraform/Terramaid/Terravision/Mermaid topics; Slides row is a placeholder (no slides yet).
- **Agradecimientos** — added as a placeholder (`TBD`); names to be filled in later.
- **Repository structure** and **Workflows** sections from the original README are preserved as-is (already decided above).

**Decision (revised — full baseline parity pass):** After the first pass, user asked to merge in the remaining baseline sections for parity:

- **Escenario de Demo** — added as placeholder (`> TBD`), positioned after Metas (matches baseline order).
- **Video** — added as placeholder (`> TBD`), positioned after Workflows.
- **Pre-Learning** — added as placeholder (`> TBD`), positioned after Video.
- **Aprendizajes y próximos pasos** (baseline: "Learnings, and next steps") — added as placeholder (`> TBD`), positioned after Pre-Learning, before Agradecimientos.
- **Estructura de la Guía del Demo** (linked TOC) — explicitly **excluded**, even during the parity pass. User confirmed not to add it; the Repository Structure section's step1/2/3 links already serve this role.

Final section order in `README.md`: Título → Social links → Introducción → Enlace relevante → Audiencia → Metas → Escenario de Demo → Resumen → Prerequisitos relevantes → Estructura del repositorio → Workflows → Video → Pre-Learning → Aprendizajes y próximos pasos → Agradecimientos.

**Decision (revised — English parity):** `README_english.md` now lives at `steps_english_version/README_english.md` (moved by user, not root) and has been rebuilt to mirror `README.md`'s structure exactly, section for section, fully translated. Internal links point to the English step docs (`step1/2/3-*-english.md`) and `tf-demo-repo/` via a relative `../` path (file lives one level deeper than the Spanish README). Same placeholders (`TBD`) carried over for Escenario de Demo/Demo Scenario, Video, Pre-Learning, Learnings-and-next-steps, Agradecimientos/Acknowledgments.

## Open items

- Presentation URL — pending, currently placeholder.
- Slides link — pending, currently placeholder.
- Escenario de Demo / Demo Scenario, Video, Pre-Learning, Aprendizajes y próximos pasos / Learnings-and-next-steps, Agradecimientos / Acknowledgments — all content pending, currently placeholders in both languages.
- Whether `README_english.md` should also be restored at the repo root (in addition to `steps_english_version/`) — not yet decided; currently only the `steps_english_version/` copy exists.
