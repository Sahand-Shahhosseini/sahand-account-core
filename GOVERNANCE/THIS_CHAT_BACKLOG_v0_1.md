# THIS_CHAT_BACKLOG_v0_1 (Account-Core / Project-L)

This file is the hard list of what is DONE vs TODO for the *current chat mission*:
“Account-wide Content Law (Project-L) + PDF quality + GitHub hybrid protocol”.

## DONE (evidence in repo)
- CI workflow builds DOC00_TEMPLATE via LuaLaTeX.
- Fail-closed QA gate: fails on LaTeX errors / missing characters.
- SAFE_PDF_BUNDLE artifact (PDF-only + SHA256) to reduce AV false positives.
- Governance: iPad protocol + exec-loop.
- Release-on-tag workflow exists.

## TODO (next commits)
1) **Persian RTL correctness** (now patched by v0.13): polyglossia + farsi environment; CI must be green.
2) **Font policy hardening**:
   - Option A: vendor fonts in repo (preferred for byte-identical reproducibility).
   - Option B: keep system fonts but pin TeXLive+font packages (current).
3) **Release policy**:
   - SAFE default release asset (PDF-only) — implemented by v0.13.
   - Optional FULL pack only on workflow_dispatch, not auto-tag.
4) **Branch protection + PR discipline**:
   - Protect `main`: require CI green; no direct pushes (optional for now).
5) **Expand beyond DOC00**:
   - Add DOC01..DOC06 templates + a simple index build (still inside Project-L).
6) **SQLite registry integration**:
   - Write a minimal `REGISTRY.db` and store build records (DocID, version, sha256, run URL).
7) **“PDF must contain tables + charts + tests” contract enforcement**:
   - Add TeX-level asserts or parser checks that each doc includes required sections/macros.
