# GITHUB_IPAD_PROTOCOL_v0_1 (Fail-Closed)

Goal: when you are away from laptop, you can still **(a)** monitor CI status, **(b)** download SAFE PDF bundles,
and **(c)** do small text edits without breaking the repo.

## A. Minimal iPad Loop (no coding)

1. Open the repo: `Sahand-Shahhosseini/sahand-account-core`
2. Tap **Actions**
3. Tap the latest run (top)
4. Confirm it is **green** (Build + QA passed)
5. Scroll to **Artifacts**
6. Download:
   - `SAFE_PDF_BUNDLE` (PDF-only) — preferred on Windows to avoid AV false positives
   - optionally `FULL_RELEASEPACK_OPTIONAL` only if you trust your machine AV/filters

## B. Downloading Artifacts (iPad GitHub App)
- Tap the **download icon** next to the artifact.
- iOS will store it in Files app. You can forward it to laptop later.

## C. Quick Edits From iPad (safe edits only)
Use this ONLY for markdown/docs (not TeX/class/tools).

1. Repo → navigate to the file (e.g., `README.md`)
2. Tap the **pencil** icon (Edit)
3. Make the change
4. At the bottom: write a commit message:
   - `doc: ...` for documentation
5. Tap **Commit changes**

Hard rule: do NOT edit `.github/workflows/*.yml` from iPad unless I explicitly tell you the exact diff.
