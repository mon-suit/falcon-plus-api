defmodule FalconPlusApi.Api.Hostgroup do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    * Hosts 每次会覆盖该HostGroup内现有的Host List
    * 如果使用者不是 Admin 只能对创建的hostgroup做操作
    
    ### Request
    ```{
      "hosts": [
        "testhostgroup",
        "agent_test"
      ],
      "hostgroup_id": 343
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"[9312 9313] bind to hostgroup: 343"}```
  """
  def add_host(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/host>
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
    ```{"name":"testhostgroup"}```
    
    ### Response
    
    ```Status: 200```
    ```{
      "id": 343,
      "grp_name": "testhostgroup",
      "create_user": "root"
    }```
  """
  def create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    ex. /api/v1/hostgroup/343
    * 如果使用者不是 Admin 只能对创建的hostgroup做操作
    
    ### Response
    
    ```Status: 200```
    ```{"message":"hostgroup:343 has been deleted"}```
  """
  def delete(hostgroup_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/#{hostgroup_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/hostgroup/343
    
    ### Response
    
    ```Status: 200```
    ```{
      "hostgroup": {
        "id": 343,
        "grp_name": "testhostgroup",
        "create_user": "root"
      },
      "hosts": [
        {
          "id": 9313,
          "hostname": "agent_test",
          "ip": "",
          "agent_version": "",
          "plugin_version": "",
          "maintain_begin": 0,
          "maintain_end": 0
        }
      ]
    }```
  """
  def get_info_by_id(hostgroup_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/#{hostgroup_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    
    ### Response
    
    ```Status: 200```
    ```[
      {
        "id": 3,
        "grp_name": "docker-A",
        "create_user": "user-A"
      },
      {
        "id": 5,
        "grp_name": "docker-T",
        "create_user": "user-B"
      },
      {
        "id": 8,
        "grp_name": "docker-F",
        "create_user": "root"
      }
    ]```
  """
  def list(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup>
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
    
    ```{
      "tpl_id": 5,
      "grp_id": 3
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"grp_id":3,"tpl_id":5,"bind_user":2}```
  """
  def template_bind(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/template>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/hostgroup/3/template
    
    ### Response
    
    ```Status: 200```
    ```{
      "hostgroup": {
        "id": 3,
        "grp_name": "hostgroupA",
        "create_user": "root"
      },
      "templates": [
        {
          "id": 5,
          "tpl_name": "TplA",
          "parent_id": 0,
          "action_id": 12,
          "create_user": "root"
        },
        {
          "id": 91,
          "tpl_name": "TplB",
          "parent_id": 0,
          "action_id": 59,
          "create_user": "userA"
        },
        {
          "id": 94,
          "tpl_name": "TplB",
          "parent_id": 0,
          "action_id": 62,
          "create_user": "userA"
        },
        {
          "id": 103,
          "tpl_name": "TplC",
          "parent_id": 0,
          "action_id": 74,
          "create_user": "root"
        },
        {
          "id": 104,
          "tpl_name": "TplD",
          "parent_id": 0,
          "action_id": 75,
          "create_user": "root"
        },
        {
          "id": 105,
          "tpl_name": "TplE",
          "parent_id": 0,
          "action_id": 76,
          "create_user": "root"
        },
        {
          "id": 116,
          "tpl_name": "TplG",
          "parent_id": 0,
          "action_id": 87,
          "create_user": "root"
        },
        {
          "id": 125,
          "tpl_name": "TplH",
          "parent_id": 0,
          "action_id": 99,
          "create_user": "root"
        },
        {
          "id": 126,
          "tpl_name": "http",
          "parent_id": 0,
          "action_id": 100,
          "create_user": "root"
        },
        {
          "id": 127,
          "tpl_name": "TplJ",
          "parent_id": 0,
          "action_id": 101,
          "create_user": "root"
        }
      ]
    }```
  """
  def template_list(hostgroup_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/#{hostgroup_id}/template>
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
    
    ```{
      "tpl_id": 5,
      "grp_id": 3
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"template: 5 is unbind of HostGroup: 3"}```
  """
  def template_unbind(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/template>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * 如果使用者不是 Admin 只能对创建的hostgroup做操作
    
    ### Request
    ```{
      "hostgroup_id": 343,
      "host_id": 9312
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"unbind host:9312 of hostgroup: 343"}```
  """
  def unbind_host(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/host>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/hostgroup
    
    ### Request
    ```{
      "id" : 343,
      "grp_name": "test1"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{
      "message":"hostgroup profile updated"
    }```
  """
  def update(hostgroup_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/update/#{hostgroup_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * 如果使用者不是 Admin 只能对创建的 HostGroup 做操作
    * ex. /api/v1/hostgroup/1/host
    
    ### Request
    ```{
      "hosts": [
        "host01",
        "host02"
      ],
      "action": "add"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{
      "message": "[host01, host02] bind to hostgroup: test, [] have been exist"
    }```
    
    ### Request
    ```{
      "hosts": [
        "host01",
        "host02"
      ],
      "action": "remove"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{
      "message": "[host01, host02] unbind to hostgroup: test"
    }```
    
  """
  def update_partial_hosts(hostgroup_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/#{hostgroup_id}/host>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.patch
    |> Api.get_result
  end

end
