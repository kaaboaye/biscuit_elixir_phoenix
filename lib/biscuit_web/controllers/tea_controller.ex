defmodule BiscuitWeb.TeaController do
  use BiscuitWeb, :controller

  alias Biscuit.Teas
  alias Biscuit.Teas.Tea

  action_fallback BiscuitWeb.FallbackController

  def index(conn, _params) do
    tea = Teas.list_tea()
    render(conn, "index.json", tea: tea)
  end

  def create(conn, %{"tea" => tea_params}) do
    with {:ok, %Tea{} = tea} <- Teas.create_tea(tea_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.tea_path(conn, :show, tea))
      |> render("show.json", tea: tea)
    end
  end

  def show(conn, %{"id" => id}) do
    tea = Teas.get_tea!(id)
    render(conn, "show_with_brewings.json", tea: tea)
  end

  def update(conn, %{"id" => id, "tea" => tea_params}) do
    tea = Teas.get_tea!(id)

    with {:ok, %Tea{} = tea} <- Teas.update_tea(tea, tea_params) do
      render(conn, "show.json", tea: tea)
    end
  end

  def delete(conn, %{"id" => id}) do
    tea = Teas.get_tea!(id)

    with {:ok, %Tea{}} <- Teas.delete_tea(tea) do
      send_resp(conn, :no_content, "")
    end
  end
end
