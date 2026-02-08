# GitHub iPad Protocol (v0.1)

Goal: Operate ACCOUNT_CORE when you are away from the laptop, using GitHub iOS app + Safari.

## 0) What you CAN do on iPad (reliably)
- Check CI status (Actions) and read logs
- Run workflows manually (workflow_dispatch)
- Download SAFE artifacts (PDF-only bundles)
- Edit text files in the repo (README, .yml, .md, .tex, .yaml)
- Create tags/releases (better in Safari)
- Create Issues and comment on PRs

## 1) What you should NOT do on iPad
- Large refactors across many files (do on laptop)
- Binary changes (fonts, images) unless unavoidable
- Any operation that needs local build/debug

## 2) Daily use: Get the PDF safely
1. GitHub app → Repo → Actions
2. Open the latest green run
3. Scroll to Artifacts
4. Download **SAFE_PDF_BUNDLE**
5. Unzip → open PDF from `PDFS/`
6. Optional integrity check:
   - Compare SHA256 in `ANNEX/SHA256SUMS.txt`

## 3) Manual run when you need FULL pack (rare)
1. Actions → select workflow: "Project-L Build + QA + ReleasePack"
2. Tap **Run workflow**
3. Branch = main → Run
4. Download artifacts:
   - SAFE_PDF_BUNDLE (always)
   - FULL_RELEASEPACK_OPTIONAL (only for manual runs; may be blocked on Windows)

## 4) Editing files (Safari method)
GitHub app sometimes hides full editor features. Safari is more reliable.

1. Open the file in app
2. Tap "...", choose "Open in browser" (or copy link to Safari)
3. Tap the pencil icon **Edit**
4. Paste/update content
5. Commit message: short + specific
6. Commit directly to main (until PR discipline is enforced), or create a branch + PR (recommended later)

## 5) Creating a release on iPad (Safari)
1. Repo → Releases → Draft a new release
2. Tag: v0.1.0 (or next)
3. Title: ACCOUNT_CORE v0.1.0
4. Notes: what changed + what passed
5. Publish release
