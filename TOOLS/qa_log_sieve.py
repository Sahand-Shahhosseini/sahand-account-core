#!/usr/bin/env python3

import sys, re, pathlib

def main():
    if len(sys.argv) != 2:
        print("Usage: qa_log_sieve.py path/to/main.log")
        return 2
    log_path = pathlib.Path(sys.argv[1])
    if not log_path.exists():
        print(f"QA FAIL: log not found: {log_path}")
        return 2
    txt = log_path.read_text(encoding="utf-8", errors="replace")

    # 1) Hard LaTeX fatal patterns
    fatal_patterns = [
        r"^! LaTeX Error:",
        r"^! Package .* Error:",
        r"^! Emergency stop\.",
        r"^!  ==> Fatal error occurred",
        r"^LaTeX Error:",
    ]
    for pat in fatal_patterns:
        if re.search(pat, txt, flags=re.MULTILINE):
            print("QA FAIL: LaTeX fatal error pattern detected")
            return 1

    # 2) Missing character / tofu risk
    # LuaLaTeX typically emits: "Missing character: There is no ..."
    if re.search(r"Missing character:\s+There is no", txt):
        print("QA FAIL: Missing character (tofu risk)")
        return 1

    # 3) Overfull is not fatal by default (can be upgraded later)
    print("QA PASS")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
