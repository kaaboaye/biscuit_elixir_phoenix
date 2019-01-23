defmodule BiscuitWeb.TeaControllerTest do
  use BiscuitWeb.ConnCase

  alias Biscuit.Teas
  alias Biscuit.Teas.Tea

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:tea) do
    {:ok, tea} = Teas.create_tea(@create_attrs)
    tea
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tea", %{conn: conn} do
      conn = get(conn, Routes.tea_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create tea" do
    test "renders tea when data is valid", %{conn: conn} do
      conn = post(conn, Routes.tea_path(conn, :create), tea: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.tea_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.tea_path(conn, :create), tea: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update tea" do
    setup [:create_tea]

    test "renders tea when data is valid", %{conn: conn, tea: %Tea{id: id} = tea} do
      conn = put(conn, Routes.tea_path(conn, :update, tea), tea: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.tea_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, tea: tea} do
      conn = put(conn, Routes.tea_path(conn, :update, tea), tea: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete tea" do
    setup [:create_tea]

    test "deletes chosen tea", %{conn: conn, tea: tea} do
      conn = delete(conn, Routes.tea_path(conn, :delete, tea))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.tea_path(conn, :show, tea))
      end
    end
  end

  defp create_tea(_) do
    tea = fixture(:tea)
    {:ok, tea: tea}
  end
end
