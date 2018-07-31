defmodule FalconPlusApi.Api.Plugin do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    * grp_id: hostgroup id
    
    ### Request
    
    ```{
      "hostgroup_id": 343,
      "dir_path": "testpath"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{
      "id": 1501,
      "grp_id": 343,
      "dir": "testpath",
      "create_user": "root"
    }```
  """
  def create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/plugin>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/plugin/1501
    
    ### Response
    
    ```Status: 200```
    ```{"message":"plugin:1501 is deleted"}```
  """
  def delete(plugin_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/plugin/#{plugin_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/hostgroup/343/plugins
    * grp_id: hostgroup id
    
    ### Response
    
    ```Status: 200```
    ```[
      {
        "id": 1499,
        "grp_id": 343,
        "dir": "testpath",
        "create_user": "root"
      },
      {
        "id": 1501,
        "grp_id": 343,
        "dir": "testpath",
        "create_user": "root"
      }
    ]```
  """
  def info_by_id(hostgroup_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/#{hostgroup_id}/plugins>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

end
