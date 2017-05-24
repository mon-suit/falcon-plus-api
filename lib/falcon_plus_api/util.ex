defmodule FalconPlusApi.Util do
  require Logger


  @doc ~S"""
  ## Examples
      iex(1)> FalconPlusApi.Util.url("/api/v1/user/login", :second)
      "127.0.0.2:8080/api/v1/user/login"

      iex(2)> FalconPlusApi.Util.url("/api/v1/user/login")
      "127.0.0.1:8080/api/v1/user/login"
  """
  def url(url, addr \\ nil ) do
    addr = addr(addr)
    url = String.replace(url, ~r/^\/+/, "")
    unless is_nil(addr)  do
      "#{addr}/#{url}"
    end
  end


  @doc ~S"""
  ## Examples
      iex(1)> FalconPlusApi.Util.url_with_params(~S(/api/v1/hostgroup/#{hostgroup_id}), %{"hostgroup_id" => 10})
      "127.0.0.1:8080/api/v1/hostgroup/10"

      iex(2)> FalconPlusApi.Util.url_with_params(~S(/api/v1/hostgroup/#{hostgroup_id}/plugins), %{"hostgroup_id" => 10})
      "127.0.0.1:8080/api/v1/hostgroup/10/plugins"
  """
  def url_with_params(url, param, addr \\ nil) when not is_nil(param) do 

    url(url, addr)
      |> String.split( "/")
      |> Enum.map(fn str ->
        case Regex.run(~R/#\{(.+?)\}/, str, capture: :all_but_first) do
          [key] -> param[key]
          _ -> str
        end
      end) 
      |> Enum.join("/")

  end

  def addr(addr \\ nil ) do
    addrs = Application.get_env(:falcon_plus_api, :addr)
    ch = addr || Application.get_env(:falcon_plus_api, :default)

    if ! is_nil(ch) and ! is_nil(addrs[ch]) do
      addrs[ch]
    else
      Logger.warn "addrs: #{inspect addrs}, addr: #{ch}"
      nil
    end
  end

end
