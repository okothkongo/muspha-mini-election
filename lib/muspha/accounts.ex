defmodule Muspha.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Muspha.Repo

  alias Muspha.Accounts.Elector
  alias Muspha.Accounts.Position

  @doc """
  Returns the list of electors.

  ## Examples

      iex> list_electors()
      [%Elector{}, ...]

  """
  def list_electors do
    Repo.all(Elector)
  end

  @doc """
  Gets a single elector.

  Raises `Ecto.NoResultsError` if the elector does not exist.

  ## Examples

      iex> get_elector!(123)
      %elector{}

      iex> get_elector!(456)
      ** (Ecto.NoResultsError)

  """
  def get_elector!(id), do: Repo.get!(Elector, id)

  @doc """
  Creates a elector.

  ## Examples

      iex> create_elector(%{field: value})
      {:ok, %elector{}}

      iex> create_elector(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_elector!(attrs \\ %{}) do
    %Elector{}
    |> Elector.changeset(attrs)
    |> Repo.insert!()
  end

  @doc """
  Deletes a elector.

  ## Examples

      iex> delete_elector(elector)
      {:ok, %elector{}}

      iex> delete_elector(elector)
      {:error, %Ecto.Changeset{}}

  """
  def delete_elector(%Elector{} = elector) do
    Repo.delete(elector)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking elector changes.

  ## Examples

      iex> change_elector(elector)
      %Ecto.Changeset{data: %Elector{}}

  """
  def change_elector(%Elector{} = elector, attrs \\ %{}) do
    Elector.changeset(elector, attrs)
  end

  def create_position!(attrs \\ %{}) do
    %Position{}
    |> Position.changeset(attrs)
    |> Repo.insert!()
  end

  def list_positions do
    Repo.all(Position)
  end
end
