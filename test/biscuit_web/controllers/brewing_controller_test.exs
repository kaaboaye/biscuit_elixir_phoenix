defmodule BiscuitWeb.BrewingControllerTest do
  use BiscuitWeb.ConnCase

  alias Biscuit.Brewings
  alias Biscuit.Brewings.Brewing

  @create_attrs %{
    amount: 42,
    taste: "some taste",
    timespan: 42,
    water_temp: 42
  }
  @update_attrs %{
    amount: 43,
    taste: "some updated taste",
    timespan: 43,
    water_temp: 43
  }
  @invalid_attrs %{amount: nil, taste: nil, timespan: nil, water_temp: nil}

  def fixture(:brewing) do
    {:ok, brewing} = Brewings.create_brewing(@create_attrs)
    brewing
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all brewings", %{conn: conn} do
      conn = get(conn, Routes.brewing_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create brewing" do
    test "renders brewing when data is valid", %{conn: conn} do
      conn = post(conn, Routes.brewing_path(conn, :create), brewing: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.brewing_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => 42,
               "taste" => "some taste",
               "timespan" => 42,
               "water_temp" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.brewing_path(conn, :create), brewing: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update brewing" do
    setup [:create_brewing]

    test "renders brewing when data is valid", %{conn: conn, brewing: %Brewing{id: id} = brewing} do
      conn = put(conn, Routes.brewing_path(conn, :update, brewing), brewing: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.brewing_path(conn, :show, id))

      assert %{
               "id" => id,
               "amount" => 43,
               "taste" => "some updated taste",
               "timespan" => 43,
               "water_temp" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, brewing: brewing} do
      conn = put(conn, Routes.brewing_path(conn, :update, brewing), brewing: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete brewing" do
    setup [:create_brewing]

    test "deletes chosen brewing", %{conn: conn, brewing: brewing} do
      conn = delete(conn, Routes.brewing_path(conn, :delete, brewing))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.brewing_path(conn, :show, brewing))
      end
    end
  end

  defp create_brewing(_) do
    brewing = fixture(:brewing)
    {:ok, brewing: brewing}
  end
end
