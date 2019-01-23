defmodule BiscuitWeb.BrewingController do
  use BiscuitWeb, :controller

  alias Biscuit.Brewings
  alias Biscuit.Brewings.Brewing

  action_fallback BiscuitWeb.FallbackController

  def index(conn, _params) do
    brewings = Brewings.list_brewings()
    render(conn, "index.json", brewings: brewings)
  end

  def create(conn, %{"brewing" => brewing_params}) do
    brewing_params = transform_brewing_attrs(brewing_params)

    with {:ok, %Brewing{} = brewing} <- Brewings.create_brewing(brewing_params) do
      conn
      |> put_status(:created)
      # |> put_resp_header("location", Routes.brewing_path(conn, :show, brewing))
      |> render("show.json", brewing: brewing)
    end
  end

  def show(conn, %{"id" => id}) do
    brewing = Brewings.get_brewing!(id)
    render(conn, "show.json", brewing: brewing)
  end

  def update(conn, %{"id" => id, "brewing" => brewing_params}) do
    brewing_params = transform_brewing_attrs(brewing_params)
    brewing = Brewings.get_brewing!(id)

    with {:ok, %Brewing{} = brewing} <- Brewings.update_brewing(brewing, brewing_params) do
      render(conn, "show.json", brewing: brewing)
    end
  end

  def delete(conn, %{"id" => id}) do
    brewing = Brewings.get_brewing!(id)

    with {:ok, %Brewing{}} <- Brewings.delete_brewing(brewing) do
      send_resp(conn, :no_content, "")
    end
  end

  defp transform_brewing_attrs(b) do
    %{
      tea_id: b["teaId"],
      amount: b["amount"],
      timespan: b["timespan"],
      water_temp: b["waterTemp"],
      taste: b["taste"]
    }
  end
end
