defmodule FalconPlusApi.Api.Host do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    
    ### Response
    
    ```Status: 200```
    ```
    [
        {
            "id": 7101,
            "hostname": "foo1.bar.com",
            "ip": "10.1.1.1",
            "agent_version": "6.0.1",
            "plugin_version": "plugin not enabled",
            "maintain_begin": 1502781600,
            "maintain_end": 1508052000
        },
        {
            "id": 47313,
            "hostname": "foo2.bar.com",
            "ip": "10.1.1.2",
            "agent_version": "",
            "plugin_version": "",
            "maintain_begin": 1502851980,
            "maintain_end": 1502862780
        }
    ]
    ```
  """
  def find_by_maintain(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hosts/maintain>
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
    ```
    {
    	"metric": "agent.alive"
    }
    ```
    
    ### Response
    
    ```Status: 200```
    ```
    [
        {
            "strategy": {
                "id": 13,
                "metric": "agent.alive",
                "tags": "",
                "max_step": 1,
                "priority": 2,
                "func": "all(#10)",
                "op": "<",
                "right_value": "0",
                "note": "machine is down",
                "run_begin": "",
                "run_end": "",
                "tpl_id": 14
            },
            "hosts": [
                "foo1.bar.com",
                "foo2.bar.com",
                "foo3.bar.com",
            ]
        },
        ...
    ]
    ```
  """
  def find_by_strategy(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/host/find_by_strategy>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

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
