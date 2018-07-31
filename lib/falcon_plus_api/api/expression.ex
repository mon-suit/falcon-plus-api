defmodule FalconPlusApi.Api.Expression do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    
    ### Request
    
    ```{
      "right_value": "0",
      "priority": 2,
      "pause": 0,
      "op": "==",
      "note": "this is a test exp",
      "max_step": 3,
      "func": "all(#3)",
      "expression": "each(metric=agent.alive endpoint=docker-agent)",
      "action": {
        "url": "http://localhost:1234/callback",
        "uic": [
          "test"
        ],
        "callback": 1,
        "before_callback_sms": 1,
        "before_callback_mail": 0,
        "after_callback_sms": 1,
        "after_callback_mail": 0
      }
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"expression created"}```
  """
  def create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/expression>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/expression/5
    
    ### Response
    
    ```Status: 200```
    ```{"message":"expression:5 has been deleted"}```
  """
  def delete(expression_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/expression/#{expression_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    ex. /api/v1/expression/5
    
    
    ### Response
    
    ```Status: 200```
    ```{
      "action": {
        "id": 5,
        "uic": "taipei",
        "url": "",
        "callback": 0,
        "before_callback_sms": 0,
        "before_callback_mail": 0,
        "after_callback_sms": 0,
        "after_callback_mail": 0
      },
      "expression": {
        "id": 5,
        "expression": "each(metric=agent.alive endpoint=docker-agent)",
        "func": "all(#3)",
        "op": "==",
        "right_value": "0",
        "max_step": 3,
        "priority": 2,
        "note": "this is a test exp",
        "action_id": 177,
        "create_user": "root",
        "pause": 1
      }
    }```
  """
  def info_by_id(expression_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/expression/#{expression_id}>
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
        "id": 2,
        "expression": "each(metric=? xx=yy)",
        "func": "all(#3)",
        "op": "==",
        "right_value": "0",
        "max_step": 3,
        "priority": 0,
        "note": "",
        "action_id": 18,
        "create_user": "root",
        "pause": 0
      },
      {
        "id": 3,
        "expression": "each(metric=ss.close.wait endpoint=docker-A)",
        "func": "all(#1)",
        "op": "!=",
        "right_value": "0",
        "max_step": 1,
        "priority": 4,
        "note": "boss docker-A 连接数大于10",
        "action_id": 91,
        "create_user": "root",
        "pause": 0
      },
      {
        "id": 4,
        "expression": "each(metric=agent.alive endpoint=docker-agent)",
        "func": "all(#3)",
        "op": "==",
        "right_value": "0",
        "max_step": 3,
        "priority": 2,
        "note": "this is a test exp",
        "action_id": 176,
        "create_user": "root",
        "pause": 1
      }
    ]```
  """
  def list(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/expression>
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
      "right_value": "0",
      "priority": 2,
      "pause": 1,
      "op": "==",
      "note": "this is a test exp",
      "max_step": 3,
      "id": 5,
      "func": "all(#3)",
      "expression": "each(metric=agent.alive endpoint=docker-agent)",
      "action": {
        "url": "http://localhost:1234/callback",
        "uic": [
          "test",
          "test2"
        ],
        "callback": 0,
        "before_callback_sms": 1,
        "before_callback_mail": 0,
        "after_callback_sms": 1,
        "after_callback_mail": 0
      }
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"expression:5 has been updated"}```
  """
  def update(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/expression>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

end
