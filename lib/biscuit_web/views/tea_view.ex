defmodule BiscuitWeb.TeaView do
  use BiscuitWeb, :view
  alias BiscuitWeb.{TeaView, BrewingView}

  def render("index.json", %{tea: tea}) do
    %{data: render_many(tea, TeaView, "tea.json")}
  end

  def render("show.json", %{tea: tea}) do
    %{data: render_one(tea, TeaView, "tea.json")}
  end

  def render("show_with_brewings.json", %{tea: tea}) do
    %{data: render_one(tea, TeaView, "tea_with_brewings.json")}
  end

  def render("tea.json", %{tea: tea}) do
    %{
      id: tea.id,
      name: tea.name,
      insertedAt: tea.inserted_at,
      updatedAt: tea.updated_at
    }
  end

  def render("tea_with_brewings.json", %{tea: tea} = attrs) do
    render("tea.json", attrs)
    |> Map.put(:brewings, render_many(tea.brewings, BrewingView, "brewing.json"))
  end
end
