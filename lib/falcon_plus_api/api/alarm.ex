defmodule FalconPlusApi.Api.Alarm do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    
    ### Request
    Content-type: application/x-www-form-urlencoded
    
    ```event_id=s_165_cef145900bf4e2a4a0db8b85762b9cdb ```
    
    ### Response
    
    ```Status: 200```
    ```
        [
            {
                "closed_at": null,
                "closed_note": "",
                "cond": "0 != 66",
                "current_step": 3,
                "endpoint": "agent2",
                "expression_id": 0,
                "func": "all(#1)",
                "id": "s_165_cef145900bf4e2a4a0db8b85762b9cdb",
                "metric": "cpu.idle",
                "note": "\u5a13\ue103\u2502\u935b\u5a45\ue11f\u9477\ue044\u5aca\u93c7\u5b58\u67ca",
                "priority": 0,
                "process_note": 56603,
                "process_status": "ignored",
                "status": "PROBLEM",
                "step": 300,
                "strategy_id": 165,
                "template_id": 45,
                "timestamp": "2017-03-23T15:51:11+08:00",
                "tpl_creator": "root",
                "update_at": "2016-06-23T05:00:00+08:00",
                "user_modified": 0
            }
        ]
    ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def eventcases_get_by_id(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/alarm/eventcases>
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
            "endTime": 1480521600,
            "limit": 10,
            "process_status": "ignored,unresolved",
            "startTime": 1466956800,
            "status": "PROBLEM",
            "endpoints": ["agent4"],
            "strategy_id": 46,
            "template_id": 126
        }
    ```
    
    ### Response
    
    ```Status: 200```
    ```
        {
            "closed_at": null,
            "closed_note": "",
            "cond": "48.33759590792839 > 40",
            "current_step": 1,
            "endpoint": "agent4",
            "expression_id": 0,
            "func": "all(#3)",
            "id": "s_46_1ac45122afb893adc02fbd30154ac303",
            "metric": "cpu.iowait",
            "note": "CPU I/O wait\u74d2\u5470\u7e4340",
            "priority": 1,
            "process_note": 16907,
            "process_status": "ignored",
            "status": "PROBLEM",
            "step": 1,
            "strategy_id": 46,
            "template_id": 126,
            "timestamp": "2016-08-01T06:25:00+08:00",
            "tpl_creator": "root",
            "update_at": "2016-08-01T06:25:00+08:00",
            "user_modified": 0
        }
    ]
    ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def eventcases_list(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/alarm/eventcases>
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
            "event_id": "s_165_cef145900bf4e2a4a0db8b85762b9cdb",
            "note": "test note",
            "status": "comment"
        }
    ```
    
    ### Response
    
    ```Status: 200```
    ```
        {
            "id": "s_165_cef145900bf4e2a4a0db8b85762b9cdb",
            "message": "add note to s_165_cef145900bf4e2a4a0db8b85762b9cdb successfuled"
        }
    ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def eventnote_create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/alarm/event_note>
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
    
    Content-type: application/x-www-form-urlencoded
    ```endTime=1466697600&startTime=1466611200```
    or
    ```event_id=s_165_cef145900bf4e2a4a0db8b85762b9cdb```
    
    
    ### Response
    
    ```Status: 200```
    ```
        [
            {
                "case_id": "",
                "event_caseId": "s_165_cef145900bf4e2a4a0db8b85762b9cdb",
                "note": "test",
                "status": "ignored",
                "timestamp": "2016-06-23T05:39:09+08:00",
                "user": "root"
            },
            {
                "case_id": "",
                "event_caseId": "s_165_9d223f126e7ecb3477cd6806f1ee9656",
                "note": "Ignored by user",
                "status": "ignored",
                "timestamp": "2016-06-23T05:38:56+08:00",
                "user": "root"
            }
        ]
    ```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def eventnote_get(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/alarm/event_note>
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
    
    Key|Value
  """
  def events_create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/alarm/events>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

end
