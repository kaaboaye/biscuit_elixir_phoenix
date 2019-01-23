defmodule BiscuitWeb.CORSPlug do
  @behaviour Plug

  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts \\ []) do
    conn
    |> put_resp_header("Access-Control-Allow-Origin", "*")
    |> put_resp_header("Access-Control-Allow-Methods", "POST, GET, OPTIONS")
    |> put_resp_header("Access-Control-Allow-Headers", "Content-Type")
  end
end
