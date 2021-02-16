defmodule Muspha.AccountsTest do
  use Muspha.DataCase

  alias Muspha.Accounts

  describe "electors" do
    alias Muspha.Accounts.Elector

    @valid_attrs %{
      email: "some@email.com",
      password: "somepassworD@1",
      first_name: "some first name",
      last_name: "some last name",
      admission_no: "12PH/2020"
    }

    @invalid_attrs %{email: nil, password: nil}

    def elector_fixture(attrs \\ %{}) do
      attrs
      |> Enum.into(@valid_attrs)
      |> Accounts.create_elector!()
    end

    test "list_electors/0 returns all electors" do
      elector_fixture()

      Accounts.list_electors()
      |> Enum.count()
      |> Kernel.==(1)
      |> assert
    end

    test "get_elector!/1 returns the elector with given id" do
      %Elector{email: email, id: id} = elector_fixture()

      elector = Accounts.get_elector!(id)
      assert elector.email == email
    end

    test "create_elector!/1 with valid data creates a elector" do
      assert %Elector{email: email} = Accounts.create_elector!(@valid_attrs)
      assert email == "some@email.com"
    end

    test "create_elector!/1 with invalid data returns error changeset" do
      assert_raise Ecto.InvalidChangesetError, fn ->
        Accounts.create_elector!(@invalid_attrs)
      end
    end

    test "delete_elector/1 deletes the elector" do
      elector = elector_fixture()
      assert {:ok, %Elector{}} = Accounts.delete_elector(elector)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_elector!(elector.id) end
    end

    test "change_elector/1 returns a elector changeset" do
      elector = elector_fixture()
      assert %Ecto.Changeset{} = Accounts.change_elector(elector)
    end
  end
end
