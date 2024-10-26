defmodule Sqlite3Repro.Application do
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Sqlite3Repro.Repo,
    ]

    opts = [strategy: :one_for_one, name: Sqlite3Repro.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule Sqlite3Repro.Repo do
  use Ecto.Repo,
    otp_app: :sqlite3_repro,
    adapter: Ecto.Adapters.SQLite3
end

defmodule Sqlite3Repro.MergedPullRequest do
  use Ecto.Schema

  schema "merged_pull_requests" do
    field(:json, :map)
    field(:author_login, :string)
    field(:committed_date, :naive_datetime)

    # has_one(:pr_note, GhStats.PullRequestNote, foreign_key: :pr_number)

    timestamps()
  end
end

defmodule Sqlite3Repro do
  @moduledoc """
  Documentation for `Sqlite3Repro`.
  """

  def run_and_save_merged_prs_query do
    placeholders = %{timestamp: ~N[2024-10-26 16:40:06]}

    attrs = [
      %{
        id: 12911,
        json: %{a: 42},
        author_login: "jason",
        committed_date: ~N[2024-10-25 17:57:25],

        # Inserting with placeholders results in `(Exqlite.Error) expected 6 arguments, got 5`
        inserted_at: {:placeholder, :timestamp},
        updated_at: {:placeholder, :timestamp},

        # Inserting directly successfully inserts the row
        # inserted_at: placeholders.timestamp,
        # updated_at: placeholders.timestamp,
      }
    ]

    Sqlite3Repro.Repo.insert_all(
      Sqlite3Repro.MergedPullRequest,
      attrs,
      placeholders: placeholders
    )

    :ok
  end
end
