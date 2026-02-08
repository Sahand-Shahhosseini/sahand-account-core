# sahand-account-core

ACCOUNT_CORE baseline repository for "Project-L" (StyleKit → BuildKit → QA Gate → Annex/SHA256 → Registry → ReleasePack).

## Quick Start
- Actions runs on every push
- Download **SAFE_PDF_BUNDLE** artifact to get PDFs without antivirus false positives

## Key paths
- `PROJECT_L/STYLEKIT/` : LaTeX class + style kit
- `PROJECT_L/DOCS/DOC00_TEMPLATE/` : PDF template build target
- `PROJECT_L/CONTRACT/` : quality + QA contracts (YAML)
- `PROJECT_L/TOOLS/` : build/QA tools (may trigger AV if zipped)
- `GOVERNANCE/` : operational protocols (iPad + exec loop)

## Normal workflow
1) Change files → push
2) CI builds PDF + QA
3) Download SAFE_PDF_BUNDLE (PDF-only)
4) Tag `vX.Y.Z` for milestones and publish Release
