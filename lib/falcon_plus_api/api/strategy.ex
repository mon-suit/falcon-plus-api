defmodule FalconPlusApi.Api.Strategy do
  import FalconPlusApi.Macro

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
  create_api(:create, :post, url: ~S</api/v1/strategy>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/strategy/904

### Response

```Status: 200```
```{"message":"strategy:904 has been deleted"}```
  """
  create_api(:delete, :delete, url: ~S</api/v1/strategy/#{strategy_id}>, need_sig: true)


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
  create_api(:info_by_id, :get, url: ~S</api/v1/strategy/#{strategy_id}>, need_sig: true)


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
  create_api(:list, :get, url: ~S</api/v1/strategy>, need_sig: true)


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
  create_api(:update, :put, url: ~S</api/v1/strategy>, need_sig: true)

end
