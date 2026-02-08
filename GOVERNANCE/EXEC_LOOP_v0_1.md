# EXEC_LOOP Hybrid Protocol (v0.1)

This defines the minimal-human-effort loop (You + ChatGPT + optional Codex) for ACCOUNT_CORE.

## Roles
- You (Owner): decide scope; apply patches; approve merges; publish releases.
- ChatGPT: produce patches, specs, templates, QA gates, and debugging steps.
- Codex (optional): mass-edit or generate code/files inside a PR based on a short instruction.

## Loop A — Small changes (no PR discipline yet)
1. You request change (DocID/version + goal)
2. ChatGPT returns a patch ZIP (or file-by-file content)
3. You apply patch, commit, push
4. CI must be green
5. If green → accepted as baseline

## Loop B — Enforced changes (preferred)
1. Create branch `work/<topic>`
2. Apply patch on branch
3. Open PR → CI runs
4. If CI green → merge PR
5. Tag release `vX.Y.Z` → Release workflow attaches SAFE assets

## Definition of Done (DoD)
- Build passes on CI (LuaLaTeX)
- QA gate passes (no tofu / no fatal errors / no LaTeX errors)
- SAFE_PDF_BUNDLE is downloadable
- SHA256SUMS present for PDFs
- Release tag exists for milestones (v0.1.0, v0.2.0, ...)

## Hard rule
No "official" claim without a green CI run + downloadable SAFE bundle.
