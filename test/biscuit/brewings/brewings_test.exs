defmodule Biscuit.BrewingsTest do
  use Biscuit.DataCase

  alias Biscuit.Brewings

  describe "brewings" do
    alias Biscuit.Brewings.Brewing

    @valid_attrs %{amount: 42, taste: "some taste", timespan: 42, water_temp: 42}
    @update_attrs %{amount: 43, taste: "some updated taste", timespan: 43, water_temp: 43}
    @invalid_attrs %{amount: nil, taste: nil, timespan: nil, water_temp: nil}

    def brewing_fixture(attrs \\ %{}) do
      {:ok, brewing} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Brewings.create_brewing()

      brewing
    end

    test "list_brewings/0 returns all brewings" do
      brewing = brewing_fixture()
      assert Brewings.list_brewings() == [brewing]
    end

    test "get_brewing!/1 returns the brewing with given id" do
      brewing = brewing_fixture()
      assert Brewings.get_brewing!(brewing.id) == brewing
    end

    test "create_brewing/1 with valid data creates a brewing" do
      assert {:ok, %Brewing{} = brewing} = Brewings.create_brewing(@valid_attrs)
      assert brewing.amount == 42
      assert brewing.taste == "some taste"
      assert brewing.timespan == 42
      assert brewing.water_temp == 42
    end

    test "create_brewing/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Brewings.create_brewing(@invalid_attrs)
    end

    test "update_brewing/2 with valid data updates the brewing" do
      brewing = brewing_fixture()
      assert {:ok, %Brewing{} = brewing} = Brewings.update_brewing(brewing, @update_attrs)
      assert brewing.amount == 43
      assert brewing.taste == "some updated taste"
      assert brewing.timespan == 43
      assert brewing.water_temp == 43
    end

    test "update_brewing/2 with invalid data returns error changeset" do
      brewing = brewing_fixture()
      assert {:error, %Ecto.Changeset{}} = Brewings.update_brewing(brewing, @invalid_attrs)
      assert brewing == Brewings.get_brewing!(brewing.id)
    end

    test "delete_brewing/1 deletes the brewing" do
      brewing = brewing_fixture()
      assert {:ok, %Brewing{}} = Brewings.delete_brewing(brewing)
      assert_raise Ecto.NoResultsError, fn -> Brewings.get_brewing!(brewing.id) end
    end

    test "change_brewing/1 returns a brewing changeset" do
      brewing = brewing_fixture()
      assert %Ecto.Changeset{} = Brewings.change_brewing(brewing)
    end
  end
end
