defmodule FalconPlusApi.Api.Tpl do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    Create Action to a Template
    * [Session](#/authentication) Required
    * params:
      * url: callback url
      * uic: 需要通知的使用者群组(name)
      * callback: enable/disable
    
    ### Request
    ```{
      "url": "",
      "uic": "test,tt2",
      "tpl_id": 225,
      "callback": 1,
      "before_callback_sms": 0,
      "before_callback_mail": 0,
      "after_callback_sms": 0,
      "after_callback_mail": 0
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"template created"}```
  """
  def action_create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/template/action>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    Update Action
    * [Session](#/authentication) Required
    * params:
      * url: callback url
      * uic: 需要通知的使用者群组(name)
      * callback: enable/disable
    
    ### Request
    ```{
      "url": "",
      "uic": "test,tt2,tt3",
      "id": 175,
      "callback": 1,
      "before_callback_sms": 0,
      "before_callback_mail": 0,
      "after_callback_sms": 0,
      "after_callback_mail": 0
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"action is updated, row affected: 1"}```
  """
  def action_update(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/template/action>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * parent_id: 继承现有Template
    
    ### Request
    ```{"parent_id":0,"name":"AtmpForTesting"}```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"template created"}```
  """
  def create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/template>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    Delete a Template
    * [Session](#/authentication) Required
    * ex. /api/v1/template/225
    
    ### Response
    
    ```Status: 200```
    ```{"message":"template 225 has been deleted"}```
  """
  def delete(template_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/template/#{template_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/template/178/hostgroup
    
    ### Response
    
    ```Status: 200```
    ```{
      "hostgroups": [{
          "id":33,
          "grp_name":"HostGroup",
          "create_user":"root"
        }
      ],
      "template": {
        "id": 178,
        "tpl_name": "TemplateA",
        "parent_id": 0,
        "action_id": 141,
        "create_user": "root"
      }
    }```
  """
  def hgp_list(template_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/template/#{template_id}/hostgroup>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/template/178
    
    ### Response
    
    ```Status: 200```
    ```{
      "action": {
        "id": 141,
        "uic": "admin,mm1",
        "url": "",
        "callback": 0,
        "before_callback_sms": 0,
        "before_callback_mail": 0,
        "after_callback_sms": 0,
        "after_callback_mail": 0
      },
      "stratges": [
        {
          "id": 686,
          "metric": "xxx.check",
          "tags": "name=xxx",
          "max_step": 3,
          "priority": 2,
          "func": "all(#2)",
          "op": "<",
          "right_value": "1",
          "note": "xxx服务异常",
          "run_begin": "",
          "run_end": "",
          "tpl_id": 178
        },
        {
          "id": 687,
          "metric": "xxx.sync",
          "tags": "",
          "max_step": 3,
          "priority": 2,
          "func": "all(#3)",
          "op": "!=",
          "right_value": "0",
          "note": "XXX同步异常",
          "run_begin": "",
          "run_end": "",
          "tpl_id": 178
        },
        {
          "id": 688,
          "metric": "bbb.check.mq",
          "tags": "",
          "max_step": 3,
          "priority": 2,
          "func": "all(#3)",
          "op": "==",
          "right_value": "1",
          "note": "bbb连接MQ异常",
          "run_begin": "",
          "run_end": "",
          "tpl_id": 178
        },
        {
          "id": 793,
          "metric": "aaa.proc.num",
          "tags": "",
          "max_step": 3,
          "priority": 2,
          "func": "all(#3)",
          "op": "==",
          "right_value": "1",
          "note": "aaaa 进程大于5",
          "run_begin": "",
          "run_end": "",
          "tpl_id": 178
        }
      ],
      "template": {
        "id": 178,
        "tpl_name": "TemplateA",
        "parent_id": 0,
        "action_id": 141,
        "create_user": "root"
      }
    }```
  """
  def info_by_id(template_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/template/#{template_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    Template List
    * [Session](#/authentication) Required
    
    
    ### Response
    
    ```Status: 200```
    ```[
      {
        "id": 1,
        "tpl_name": "cpu.board",
        "parent_id": 0,
        "action_id": 5,
        "create_user": "usera"
      },
      {
        "id": 2,
        "tpl_name": "traffic checking",
        "parent_id": 0,
        "action_id": 6,
        "create_user": "userb"
      },
      {
        "id": 3,
        "tpl_name": "cputest",
        "parent_id": 0,
        "action_id": 7,
        "create_user": "userc"
      },
      {
        "id": 5,
        "tpl_name": "all metrics base",
        "parent_id": 0,
        "action_id": 12,
        "create_user": "root"
      }
    ]```
  """
  def list(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/template>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * parent_id: 继承现有Template
    
    ### Request
    ```{
      "tpl_id": 225,
      "parent_id": 0,
      "name": "AtmpForTesting2"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"template updated"}```
  """
  def update(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/template/>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

end
