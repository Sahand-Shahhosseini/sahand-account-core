# GitHub Protocol v0.1 (No-CLI, Low-effort)

Designed for the constraint: **download/unzip/double-click** + minimal web clicks.

## Roles
- Sahand: creates repo, clicks merge, downloads artifacts.
- Codex: creates PRs and edits files.
- CI (GitHub Actions): builds, runs QA, publishes artifacts.
- ChatGPT: specifies patch plans and audits CI results.

## Golden rules
1) All changes land via PR (Codex recommended).
2) Merge requires CI PASS (after branch protection is enabled).
3) Official outputs come from CI artifacts only.
4) `PROJECT_L/` is the law: do not modify without explicit request.

## Operating loop
1) Sahand describes goal in chat.
2) ChatGPT issues a PatchPlan + GatePlan + Codex message.
3) Sahand pastes message into Codex.
4) Codex opens PR.
5) CI runs build + QA.
6) ChatGPT audits the run.
7) Sahand merges PR.
8) Sahand downloads ReleasePack artifact.

## After Bootstrap PASS (hardening checklist)
- Enable branch protection: require status checks to pass
- Disable direct pushes to main (optional)
- Add CODEOWNERS (optional)
- Decide public/private visibility
