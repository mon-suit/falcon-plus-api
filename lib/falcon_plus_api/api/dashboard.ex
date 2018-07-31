defmodule FalconPlusApi.Api.Dashboard do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    
    ### Request
    ```
    {
        "screen_id": 953,
        "title": "laiwei-test-graph1",
        "endpoints": ["laiweiofficemac"],
        "counters": ["value/name=pfc.push.ms","value/name=pfc.push.size"],
        "timespan": 1800, 
        "graph_type": "h", 
        "method": "AVG",
        "position": 0
    }
    ```
    
    ### Response
    
    ```Status: 200```
    
    ```{"message":"ok"}```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def graph_create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/graph>
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
    
    ``` {"endpoints":["e1", "e2"], "counters":["c1", "c2"]} ```
    
    ### Response
    
    ```Status: 200```
    
    ```
    {
        "ck": "68c07419dbd7ac65977c97d05d99440d",
        "counters": "c1|c2",
        "endpoints": "e1|e2",
        "id": 365195
    }
    ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def graph_create_tmpgraph(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/tmpgraph>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    
    ### Response
    
    ```Status: 200```
    
    ```{"message":"ok"}```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def graph_delete(id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/graph/#{id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    
    ### Response
    
    ```Status: 200```
    ```
    {
        "counters":["value/name=pfc.push.ms", "value/name=pfc.push.size"],
        "endpoints":["laiweiofficemac"],
        "falcon_tags":"",
        "graph_id":4626,
        "graph_type":"h",
        "method":"",
        "position":4626,
        "screen_id":953,
        "timespan":3600,
        "title":"test"
    }```
    
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def graph_get(id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/graph/#{id}>
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
    
    ```{"counters":["agent.alive"],"endpoints":["laiweiofficemac"]}```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def graph_get_tmpgraph_by_id(id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/tmpgraph/#{id}>
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
        "counters": ["value/name=pfc.push.ms","value/name=pfc.push.size", "agent.alive"],
        "falcon_tags": "srv=falcon"
    }
    ```
    
    ### Response
    
    ```Status: 200```
    
    ```{"message":"ok"}```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def graph_update(id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/graph/#{id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    
    ### Response
    
    ```Status: 200```
    
    ```
    [
        {
            "counters": [
                "value/name=pfc.push.ms"
            ],
            "endpoints": [
                "laiweiofficemac"
            ],
            "falcon_tags": "",
            "graph_id": 4640,
            "graph_type": "h",
            "method": "",
            "position": 0,
            "screen_id": 991,
            "timespan": 3600,
            "title": "dddd"
        },
        {
            "counters": [
                "aaa"
            ],
            "endpoints": [
                "xxx"
            ],
            "falcon_tags": "",
            "graph_id": 4641,
            "graph_type": "h",
            "method": "SUM",
            "position": 0,
            "screen_id": 991,
            "timespan": 3600,
            "title": "dddd"
        }
    ]
    ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def graphs_gets_by_screenid(screen_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/graphs/screen/#{screen_id}>
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
    Content-type: application/x-www-form-urlencoded
    
    ```name=laiwei-sceen1&pid=0```
    
    ### Response
    
    ```Status: 200```
    ```{"name":"laiwei-sceen1","pid":0,"screen_id":961} ```
    
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def screen_create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/screen>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    
    ### Response
    
    ```Status: 200```
    ```{"message":"ok"} ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def screen_delete(screen_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/screen/#{screen_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    
    ### Response
    
    ```Status: 200```
    ```{"id":961,"pid":0,"name":"laiwei-sceen1"} ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def screen_get_by_id(screen_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/screen/#{screen_id}>
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
    Content-type: application/x-www-form-urlencoded
    ```limit=100```
    
    ### Response
    ```Status: 200```
    ```
    [
        {
            "id": 952,
            "name": "a1",
            "pid": 0
        },
        {
            "id": 953,
            "name": "aa1",
            "pid": 952
        },
        {
            "id": 968,
            "name": "laiwei-screen2",
            "pid": 1
        },
        {
            "id": 972,
            "name": "laiwei-sceen1",
            "pid": 0
        },
        {
            "id": 991,
            "name": "xnew",
            "pid": 972
        },
        {
            "id": 993,
            "name": "clone3",
            "pid": 972
        },
        {
            "id": 995,
            "name": "op",
            "pid": 0
        }
    ]
    ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def screen_gets_all(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/screens>
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
    ```
    [
        {
            "id": 952,
            "name": "a1",
            "pid": 0
        },
        {
            "id": 961,
            "name": "laiwei-sceen1",
            "pid": 0
        }
    ]
    ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def screen_gets_by_pid(screen_pid, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/screens/pid/#{screen_pid}>
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
    Content-type: application/x-www-form-urlencoded
    
    ```name=laiwei-sceen1&pid=0```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"ok"} ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def screen_update(screen_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/dashboard/screen/#{screen_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

end
