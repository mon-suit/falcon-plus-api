defmodule FalconPlusApi.Util do

  def url(url, addr \\ nil ) do
    addrs = Application.get_env(:falcon_plus_api, :addr, %{})
    addr  = Map.get(addrs, addr)
    url   = String.replace(url, ~r/^\/+/, "")
    unless is_nil(addr)  do
      "#{addr}/#{url}"
    end
  end

end
