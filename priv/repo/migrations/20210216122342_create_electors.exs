defmodule Muspha.Repo.Migrations.CreateElectors do
  use Ecto.Migration

  def change do
    execute "CREATE EXTENSION IF NOT EXISTS citext", ""

    create table(:electors) do
      add :email, :citext
      add :hashed_password, :string
      add :first_name, :string
      add :last_name, :string
      add :admission_no, :string

      timestamps()
    end

    create unique_index(:electors, [:email, :admission_no])
  end
end
