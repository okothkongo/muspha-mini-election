defmodule Muspha.Accounts.Position do
  use Ecto.Schema
  import Ecto.Changeset

  schema "positions" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(position, attrs) do
    position
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
