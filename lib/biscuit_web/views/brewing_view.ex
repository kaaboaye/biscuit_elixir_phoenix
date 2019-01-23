defmodule BiscuitWeb.BrewingView do
  use BiscuitWeb, :view
  alias BiscuitWeb.BrewingView

  def render("index.json", %{brewings: brewings}) do
    %{data: render_many(brewings, BrewingView, "brewing.json")}
  end

  def render("show.json", %{brewing: brewing}) do
    %{data: render_one(brewing, BrewingView, "brewing.json")}
  end

  def render("brewing.json", %{brewing: brewing}) do
    %{
      id: brewing.id,
      amount: brewing.amount,
      timespan: brewing.timespan,
      waterTemp: brewing.water_temp,
      taste: brewing.taste,
      insertedAt: brewing.inserted_at,
      updatedAt: brewing.updated_at
    }
  end
end
