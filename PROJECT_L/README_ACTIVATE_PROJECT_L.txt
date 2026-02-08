PROJECT_L — Account Content OS (v0.1)

Goal
- Enforce a locked production pipeline for ALL official outputs:
  StyleKit → BuildKit → QA Gate → ANNEX+SHA256 → Registry(SQLite) → ReleasePack
- Fail-closed: if QA fails, output is INVALID.

Quick start (Windows, executor-mode)
1) Install MiKTeX (or TeXLive) with latexmk + lualatex enabled.
2) Ensure PowerShell is available (default on Windows).
3) Optional but recommended: Python 3.x for SQLite registry init.
4) Put required fonts into STYLEKIT\fonts\ (see STYLEKIT\README_FONTS.txt).
5) Double-click:
   - TOOLS\INIT_DB.cmd   (optional; enables SQLite registry)
   - TOOLS\BUILD_DOC.cmd (build + QA + release zip)

Outputs
- Built PDF: DOCS\DOC00_TEMPLATE\main.pdf
- QA reports: QA\QA_REPORT_*.json + .txt
- Annex: ANNEX\ANNEX.md + SHA256SUMS
- Release: RELEASEPACK_PROJECT_L_v0_1.zip

Hard rules (default)
- Any 'Missing character:' in log => FAIL.
- Any font substitution => FAIL.
- Any Overfull \hbox => FAIL.
- Q1_PDF requires at least one table + one figure + 'Tests & Gates' section.
