defmodule Muspha.Repo.Migrations.CreateElectors do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:electors) do
      add :email, :citext, null: false
      add :hashed_password, :string, null: false
      add :first_name, :string, null: false
      add :last_name, :string, null: false
      add :admission_no, :string, null: false

      timestamps()
    end

    create unique_index(:electors, [:email, :admission_no])
  end
end
