# ACCOUNT_CORE Charter v0.1 (Hybrid)

## Purpose
`ACCOUNT_CORE` is the always-on backbone repo for Sahand's account:
- enforces **ACCOUNT_CONTENT_LAW_v1.2** (Project-L)
- provides CI Build+QA to generate official artifacts (PDF/ReleasePack)
- hosts per-project folders under `PROJECTS/`

## Hybrid policy
- **Core stays stable**: `PROJECT_L/` is the law+tools. Change via PR only.
- **Projects are modular**: each project lives under `PROJECTS/<NAME>/`.
- **Spin-off rule**: when a project becomes mature, it may be extracted into a dedicated repo later.

## Official output rule
Official deliverables are **only** the artifacts produced by CI:
- ReleasePack zip
- PDFs
- QA reports
- SHA256 annex

Anything else is “draft / non-official”.
