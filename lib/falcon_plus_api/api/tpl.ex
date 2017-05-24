defmodule FalconPlusApi.Api.Tpl do
  import FalconPlusApi.Macro

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
  create_api(:action_create, :post, url: ~S</api/v1/template/action>, need_sig: true)


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
  create_api(:action_update, :put, url: ~S</api/v1/template/action>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* parent_id: 继承现有Template

### Request
```{"parent_id":0,"name":"AtmpForTesting"}```

### Response

```Status: 200```
```{"message":"template created"}```
  """
  create_api(:create, :post, url: ~S</api/v1/template/>, need_sig: true)


  @doc """
Delete a Template
* [Session](#/authentication) Required
* ex. /api/v1/template/225

### Response

```Status: 200```
```{"message":"template 225 has been deleted"}```
  """
  create_api(:delete, :delete, url: ~S</api/v1/template/#{template_id}>, need_sig: true)


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
  create_api(:info_by_id, :get, url: ~S</api/v1/template/#{template_id}>, need_sig: true)


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
  create_api(:list, :get, url: ~S</api/v1/template/>, need_sig: true)


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
  create_api(:update, :put, url: ~S</api/v1/template/>, need_sig: true)

end
