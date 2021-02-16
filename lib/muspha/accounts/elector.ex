defmodule Muspha.Accounts.Elector do
  use Ecto.Schema
  import Ecto.Changeset

  schema "electors" do
    field :first_name, :string
    field :last_name, :string
    field :admission_no, :string
    field :email, :string
    field :password, :string, virtual: true
    field :hashed_password, :string

    timestamps()
  end

  @doc false
  def changeset(elector, attrs) do
    elector
    |> cast(attrs, [:email, :password, :first_name, :last_name, :admission_no])
    |> validate_required([:first_name, :last_name])
    |> unique_constraint(:email)
    |> validate_format(:email, email_regex())
    |> validate_password()
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
        put_change(
          changeset,
          :hashed_password,
          add_hash(password)
        )

      _ ->
        changeset
    end
  end

  defp add_hash(password) do
    Bcrypt.add_hash(password).password_hash
  end

  defp email_regex do
    ~r/\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/
  end

  defp validate_password(changeset) do
    changeset
    |> validate_required([:password])
    |> validate_length(:password, min: 6, max: 80)
    |> validate_format(:password, ~r/[a-z]/, message: "at least one lower case character")
    |> validate_format(:password, ~r/[A-Z]/, message: "at least one upper case character")
    |> validate_format(:password, ~r/(?=.*[[:^alnum:]])/, message: "punctuation character")
    |> validate_format(:password, ~r/(?=.*\d)/, message: "at least one digit")
    |> hash_password()
  end
end
