# Sqlite3Repro

mix deps.get
mix ecto.create
mix ecto.migrate
iex -S mix
Sqlite3Repro.run_and_save_merged_prs_query

Results in an unexpected error:
> iex(1)> Sqlite3Repro.run_and_save_merged_prs_query
> ** (Exqlite.Error) expected 6 arguments, got 5
> INSERT INTO "merged_pull_requests" ("id","json","author_login","committed_date","inserted_at","updated_at") VALUES (?,?,?,?,?,?)
>     (ecto_sql 3.12.1) lib/ecto/adapters/sql.ex:1096: Ecto.Adapters.SQL.raise_sql_call_error/1
>     (ecto_sql 3.12.1) lib/ecto/adapters/sql.ex:967: Ecto.Adapters.SQL.insert_all/9
>     (ecto 3.12.4) lib/ecto/repo/schema.ex:59: Ecto.Repo.Schema.do_insert_all/7
>     (sqlite3_repro 0.1.0) lib/sqlite3_repro.ex:60: Sqlite3Repro.run_and_save_merged_prs_query/0
>     iex:1: (file)

