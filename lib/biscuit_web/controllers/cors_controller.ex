defmodule BiscuitWeb.CORSController do
  use BiscuitWeb, :controller

  action_fallback BiscuitWeb.FallbackController

  def get(conn, _attrs) do
    conn
    |> BiscuitWeb.CORSPlug.call()
    |> resp(:no_content, "")
  end
end
