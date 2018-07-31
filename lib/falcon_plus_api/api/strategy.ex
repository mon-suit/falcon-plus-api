defmodule FalconPlusApi.Api.Strategy do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    
    
    ### Request
    ```{
      "tpl_id": 221,
      "tags": "",
      "run_end": "24:00",
      "run_begin": "00:00",
      "right_value": "1",
      "priority": 1,
      "op": "==",
      "note": "this is a test",
      "metric": "agent.alive",
      "max_step": 3,
      "func": "all(#3)"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"stragtegy created"}```
  """
  def create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/strategy>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/strategy/904
    
    ### Response
    
    ```Status: 200```
    ```{"message":"strategy:904 has been deleted"}```
  """
  def delete(strategy_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/strategy/#{strategy_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/strategy/904
    
    ### Response
    
    ```Status: 200```
    ```{
      "id": 904,
      "metric": "agent.alive",
      "tags": "",
      "max_step": 3,
      "priority": 1,
      "func": "all(#3)",
      "op": "==",
      "right_value": "1",
      "note": "this is a test",
      "run_begin": "00:00",
      "run_end": "24:00",
      "tpl_id": 221
    }```
  """
  def info_by_id(strategy_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/strategy/#{strategy_id}>
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
        "id": 893,
        "metric": "process.num",
        "tags": "name=redis",
        "max_step": 3,
        "priority": 2,
        "func": "all(#2)",
        "op": "<",
        "right_value": "1",
        "note": "Redis异常",
        "run_begin": "",
        "run_end": "",
        "tpl_id": 221
      },
      {
        "id": 894,
        "metric": "process.num",
        "tags": "name=smtp",
        "max_step": 3,
        "priority": 2,
        "func": "all(#3)",
        "op": "<",
        "right_value": "1",
        "note": "Smtp异常",
        "run_begin": "",
        "run_end": "",
        "tpl_id": 221
      },
      {
        "id": 895,
        "metric": "process.num",
        "tags": "cmdline=logger",
        "max_step": 3,
        "priority": 3,
        "func": "all(#5)",
        "op": "<",
        "right_value": "2",
        "note": "logger异常",
        "run_begin": "",
        "run_end": "",
        "tpl_id": 221
      },
    ]```
  """
  def list(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/strategy>
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
      "tags": "",
      "run_end": "",
      "run_begin": "",
      "right_value": "1",
      "priority": 2,
      "op": "==",
      "note": "this is a test",
      "metric": "agent.alive",
      "max_step": 3,
      "id": 904,
      "func": "all(#3)"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"stragtegy:904 has been updated"}```
  """
  def update(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/strategy>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

end
