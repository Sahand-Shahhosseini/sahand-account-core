# RELEASE_PROTOCOL_v0_1

A Release is allowed only if:
- CI Build + QA is green on `main`
- the `SAFE_PDF_BUNDLE` artifact exists and downloads

## Tagging rule
Use tags like: `v0.12.0` (semantic-ish; you can later formalize)

## How
Option A (Web):
1. Repo → Releases → Draft new release
2. Choose tag: `vX.Y.Z` (create new tag)
3. Title: `ACCOUNT_CORE vX.Y.Z`
4. Publish

Option B (GitHub Desktop) can be added later.

## What gets published
- SAFE PDF bundle (preferred)
- Full ReleasePack (optional, may trigger antivirus false positives)
