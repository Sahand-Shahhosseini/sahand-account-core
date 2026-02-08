ACCOUNT_CORE_PATCH_v0_14_1_failclosed_install_lang_arabic

Problem:
- Build fails with:
    ! LaTeX Error: File `luabidi.sty' not found.
  This is required by polyglossia/gloss-farsi for Persian RTL.

Root cause (confirmed by checking current workflow file):
- .github/workflows/project_l_build_qa.yml does NOT install texlive-lang-arabic.
- Same for .github/workflows/release_on_tag.yml.

Fix:
- Add texlive-lang-arabic.
- Make TeX install step fail-closed (remove global "|| true").
- Keep fonts install optional (may fail without breaking the pipeline).

Apply:
- Overwrite:
  - .github/workflows/project_l_build_qa.yml
  - .github/workflows/release_on_tag.yml
- Commit + push.
