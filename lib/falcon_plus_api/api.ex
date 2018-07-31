defmodule FalconPlusApi.Api do

  use Maxwell.Builder

  middleware Maxwell.Middleware.Opts, connect_timeout: 10_000
  middleware Maxwell.Middleware.Retry
  middleware Maxwell.Middleware.Json
  middleware Maxwell.Middleware.Compress
  middleware Maxwell.Middleware.Logger

  adapter Maxwell.Adapter.Httpc

  def set_opts(conn, keywords) do
    {body, keywords} = Keyword.pop(keywords, :body)
    conn = if body, do: put_req_body(conn, body), else: conn

    {query, keywords} = Keyword.pop(keywords, :query)
    conn = if query, do: put_query_string(conn, query), else: conn

    keywords |> Enum.reduce(conn, fn ({k, v}, conn) -> put_private(conn, k, v) end)
  end

  def get_result({:ok, conn=%Maxwell.Conn{}}) do
    body = get_resp_body(conn)
    if conn.status == 200 do
      {:ok, body}
    else
      {:error, body}
    end
  end

  def get_result({:error, reason_term, %Maxwell.Conn{}}) do
    {:error, reason_term}
  end

end
