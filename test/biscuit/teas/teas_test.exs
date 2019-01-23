defmodule Biscuit.TeasTest do
  use Biscuit.DataCase

  alias Biscuit.Teas

  describe "tea" do
    alias Biscuit.Teas.Tea

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def tea_fixture(attrs \\ %{}) do
      {:ok, tea} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Teas.create_tea()

      tea
    end

    test "list_tea/0 returns all tea" do
      tea = tea_fixture()
      assert Teas.list_tea() == [tea]
    end

    test "get_tea!/1 returns the tea with given id" do
      tea = tea_fixture()
      assert Teas.get_tea!(tea.id) == tea
    end

    test "create_tea/1 with valid data creates a tea" do
      assert {:ok, %Tea{} = tea} = Teas.create_tea(@valid_attrs)
      assert tea.name == "some name"
    end

    test "create_tea/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Teas.create_tea(@invalid_attrs)
    end

    test "update_tea/2 with valid data updates the tea" do
      tea = tea_fixture()
      assert {:ok, %Tea{} = tea} = Teas.update_tea(tea, @update_attrs)
      assert tea.name == "some updated name"
    end

    test "update_tea/2 with invalid data returns error changeset" do
      tea = tea_fixture()
      assert {:error, %Ecto.Changeset{}} = Teas.update_tea(tea, @invalid_attrs)
      assert tea == Teas.get_tea!(tea.id)
    end

    test "delete_tea/1 deletes the tea" do
      tea = tea_fixture()
      assert {:ok, %Tea{}} = Teas.delete_tea(tea)
      assert_raise Ecto.NoResultsError, fn -> Teas.get_tea!(tea.id) end
    end

    test "change_tea/1 returns a tea changeset" do
      tea = tea_fixture()
      assert %Ecto.Changeset{} = Teas.change_tea(tea)
    end
  end
end
