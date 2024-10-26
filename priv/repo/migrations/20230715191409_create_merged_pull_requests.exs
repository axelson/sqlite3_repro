defmodule GhStats.Repo.Migrations.CreateMergedPullRequests do
  use Ecto.Migration

  def change do
    create table(:merged_pull_requests) do
      add :json, :jsonb, null: false
      add :committed_date, :naive_datetime, null: false
      add :author_login, :string, null: false

      timestamps()
    end

    create table(:pull_request_notes, primary_key: false) do
      add :pr_number, :integer, null: false, primary_key: true
      add :notes, :text, null: true
      add :viewed_at, :naive_datetime
      add :reviewed_at, :naive_datetime

      timestamps()
    end

    create index(:merged_pull_requests, [:committed_date])
    create index(:merged_pull_requests, [:author_login])
  end
end
