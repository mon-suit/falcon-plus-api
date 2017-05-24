defmodule FalconPlusApi.Api.Default do
  import FalconPlusApi.Macro

  @doc """
透过Session检查去判定使用者可否存取资源

### RequestHeader
透过RequestHeader 的 Apitoken做验证
```"RequestHeader": {
  "Apitoken": "{\"name\":\"root\",\"sig\":\"427d6803b78311e68afd0242ac130006\"}",
  "X-Forwarded-For": " 127.0.0.1"
}```

### Response

Session 为有效
```Status: 200```
```{"message":"session is vaild!"}```

For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  create_api(:authentication, :get, url: ~S</api/v1/user/login>, need_sig: false)


  @doc """
* [Session](#/authentication) Required
* q: 使用 regex 查询字符
  * option 参数


### Response

```Status: 200```
```[
  {
    "endpoint": "docker-agent",
    "id": 7
  },
  {
    "endpoint": "docker-task",
    "id": 6
  },
  {
    "endpoint": "graph",
    "id": 3
  },
  {
    "endpoint": "nodata",
    "id": 920
  },
  {
    "endpoint": "task",
    "id": 5
  }
]```
  """
  create_api(:endpoints, :get, url: ~S</api/v1/graph/endpoint>, need_sig: true)

end
