# GITHUB_DESKTOP_PROTOCOL_v0_1 (Windows; executor-mode)

This is the lowest-effort, repeatable workflow.

## 0) Install once
- GitHub Desktop (official)
- VS Code (optional; not required)

## 1) Clone
1. GitHub Desktop → `File → Clone repository`
2. Choose: `sahand-account-core`
3. Pick a local folder, e.g. `D:\ACCOUNT_CORE\sahand-account-core`

## 2) Apply a patch ZIP (what I will usually send you)
1. Download patch ZIP I give you
2. Extract it
3. Copy folders/files into the repo folder (overwrite when asked)
4. GitHub Desktop: you should see changes

## 3) Commit + Push
1. Write commit message:
   - `fix: ...` (bug)
   - `style: ...` (StyleKit)
   - `qa: ...` (QA rules)
   - `docs: ...` (docs)
2. Click **Commit to main**
3. Click **Push origin**

## 4) Verify
1. Open repo in browser → Actions
2. Latest run must be green
3. Download `SAFE_PDF_BUNDLE` artifact
