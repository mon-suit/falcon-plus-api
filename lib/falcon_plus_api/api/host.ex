defmodule FalconPlusApi.Api.Host do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    
    ### Request
    ```
    {
        "ids": [1,2,3,4],
        "maintain_begin": 1497951907,
        "maintain_end": 1497951907
    }
    ```
    or
    ```
    {
        "hosts": ["host.a","host.b"],
        "maintain_begin": 1497951907,
        "maintain_end": 1497951907
    }
    ```
    
    ### Response
    
    ```Status: 200```
    ```{ "message": "Through: hosts, Affect row: 2" }```
  """
  def maintain(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/host/maintain>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/host/1647/hostgroup
    * grp_name: hostgroup name
    
    ### Response
    
    ```Status: 200```
    ```[
      {
        "id": 78,
        "grp_name": "tplB",
        "create_user": "userA"
      },
      {
        "id": 145,
        "grp_name": "Owl_Default_Group",
        "create_user": "userA"
      }
    ]```
  """
  def related_hostgroup(host_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/host/#{host_id}/hostgroup>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/host/1647/template
    * tpl_name: template name
    
    ### Response
    
    ```Status: 200```
    ```[
      {
        "id": 125,
        "tpl_name": "tplA",
        "parent_id": 0,
        "action_id": 99,
        "create_user": "root"
      },
      {
        "id": 142,
        "tpl_name": "tplB",
        "parent_id": 0,
        "action_id": 111,
        "create_user": "root"
      },
      {
        "id": 180,
        "tpl_name": "tplC",
        "parent_id": 0,
        "action_id": 142,
        "create_user": "root"
      }
    ]```
  """
  def related_template(host_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/host/#{host_id}/template>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    
    ### Request
    ```{"ids": [1,2,3,4]}```
    or
    ```{"hosts": ["host.a","host.b"]}```
    
    ### Response
    
    ```Status: 200```
    ```{ "message": "Through: hosts, Affect row: 2" }```
  """
  def reset(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/host/maintain>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

end
