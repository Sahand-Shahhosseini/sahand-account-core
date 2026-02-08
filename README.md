# sahand-account-core (ACCOUNT_CORE)

This repo is the always-on backbone for Sahand's account content production.

**Default law:** ACCOUNT_CONTENT_LAW_v1.2 (Project-L) — fail-closed pipeline:
StyleKit → BuildKit → QA Gate → ANNEX+SHA256 → Registry(SQLite) → ReleasePack

## Layout
- `PROJECT_L/` : always-on production OS (StyleKit/BuildKit/QA/ANNEX/Registry)
- `PROJECTS/`  : per-project folders (custom docs/data/configs)
- `.github/workflows/` : CI to build + QA + publish artifacts

## No-CLI workflow (recommended)
- Use GitHub web UI to upload/edit files.
- Use GitHub Actions to build and produce ReleasePack artifacts.
- Download ReleasePack to laptop, unzip, double-click local scripts if needed.

## Why is the bootstrap small?
This repo seed is mostly **text** (LaTeX, YAML, scripts). Text compresses extremely well.
Big parts (TeX toolchain, compiled PDFs, binary fonts) are **not** bundled; CI installs needed packages and produces artifacts.

For deterministic local builds, put open fonts under `PROJECT_L/STYLEKIT/fonts/` and rebuild.


## Bootstrap upload (web UI)
- Download the bootstrap zip.
- Extract it.
- Upload the *contents* of `sahand-account-core/` into the GitHub repo root.
- After upload, run the workflow in the **Actions** tab and download the produced artifact.
