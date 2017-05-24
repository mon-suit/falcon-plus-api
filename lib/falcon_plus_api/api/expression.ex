defmodule FalconPlusApi.Api.Expression do
  import FalconPlusApi.Macro

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
  create_api(:create, :post, url: ~S</api/v1/expression>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/expression/5

### Response

```Status: 200```
```{"message":"expression:5 has been deleted"}```
  """
  create_api(:delete, :delete, url: ~S</api/v1/expression/#{expression_id}>, need_sig: true)


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
  create_api(:info_by_id, :get, url: ~S</api/v1/expression/#{expression_id}>, need_sig: true)


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
  create_api(:list, :get, url: ~S</api/v1/expression>, need_sig: true)


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
  create_api(:update, :put, url: ~S</api/v1/expression>, need_sig: true)

end
