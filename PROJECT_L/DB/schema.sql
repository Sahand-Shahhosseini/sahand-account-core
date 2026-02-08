-- Project-L registry schema (minimal v0.1)
CREATE TABLE IF NOT EXISTS builds(
  build_id TEXT PRIMARY KEY,
  started_at TEXT,
  ended_at TEXT,
  toolchain TEXT,
  cmdline TEXT,
  exit_code INTEGER
);

CREATE TABLE IF NOT EXISTS qa_runs(
  qa_id TEXT PRIMARY KEY,
  build_id TEXT,
  timestamp TEXT,
  pass INTEGER,
  report_path TEXT,
  FOREIGN KEY(build_id) REFERENCES builds(build_id)
);

CREATE TABLE IF NOT EXISTS artifacts(
  artifact_id TEXT PRIMARY KEY,
  docid TEXT,
  version TEXT,
  status TEXT,
  path TEXT,
  sha256 TEXT,
  build_id TEXT,
  qa_id TEXT,
  created_at TEXT
);

CREATE TABLE IF NOT EXISTS claims(
  claim_id TEXT PRIMARY KEY,
  docid TEXT,
  type TEXT,
  status TEXT,
  statement TEXT,
  deps_json TEXT,
  evidence_json TEXT
);
