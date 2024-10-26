import Config

config :sqlite3_repro, Sqlite3Repro.Repo,
  database: "priv/gh_stats.db",
  stacktrace: true,
  show_sensitive_data_on_connection_error: true,
  pool_size: 10,
  # We log via EctoDevLogger instead
  log: false
