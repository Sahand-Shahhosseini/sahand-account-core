import sqlite3, pathlib, sys, time
root = pathlib.Path(__file__).resolve().parents[1]
db_path = root / "DB" / "registry.sqlite"
schema_path = root / "DB" / "schema.sql"
db_path.parent.mkdir(parents=True, exist_ok=True)

con = sqlite3.connect(db_path)
cur = con.cursor()
cur.executescript(schema_path.read_text(encoding="utf-8"))
con.commit()
con.close()
print(f"OK: initialized {db_path}")
