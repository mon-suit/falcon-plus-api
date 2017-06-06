defmodule FalconPlusApi.Api.Alarm do
  import FalconPlusApi.Macro

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
  create_api(:eventcases_get_by_id, :get, url: ~S</api/v1/alarm/eventcases>, need_sig: true)


  @doc """
* [Session](#/authentication) Required

### Request

```
    {
        "endTime": 1480521600,
        "limit": 10,
        "process_status": "ignored,unresolved",
        "startTime": 1466956800,
        "status": "PROBLEM"
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
    },
    {
        "closed_at": null,
        "closed_note": "",
        "cond": "95.16331658291456 <= 98",
        "current_step": 1,
        "endpoint": "agent5",
        "expression_id": 0,
        "func": "avg(#3)",
        "id": "s_50_6438ac68b30e2712fb8f00d894c46e21",
        "metric": "cpu.idle",
        "note": "cpu\u7ecc\u6d2a\u68fd\u934a\u517c\u59e4\u7480\ufffd",
        "priority": 3,
        "process_note": 1181,
        "process_status": "ignored",
        "status": "PROBLEM",
        "step": 1,
        "strategy_id": 50,
        "template_id": 53,
        "timestamp": "2016-07-03T16:13:00+08:00",
        "tpl_creator": "root",
        "update_at": "2016-07-03T16:13:00+08:00",
        "user_modified": 0
    }
]
```

For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  create_api(:eventcases_list, :post, url: ~S</api/v1/alarm/eventcases>, need_sig: true)


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
  create_api(:eventnote_create, :post, url: ~S</api/v1/alarm/event_note>, need_sig: true)


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
  create_api(:eventnote_get, :get, url: ~S</api/v1/alarm/event_note>, need_sig: true)


  @doc """
* [Session](#/authentication) Required

### Request

Content-type: application/x-www-form-urlencoded

Key|Value
  """
  create_api(:events_create, :post, url: ~S</api/v1/alarm/events>, need_sig: true)

end
