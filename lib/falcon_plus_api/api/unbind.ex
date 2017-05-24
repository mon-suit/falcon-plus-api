defmodule FalconPlusApi.Api.Unbind do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required
* 如果使用者不是 Admin 只能对创建的hostgroup做操作

### Request
```{
  "hostgroup_id": 343,
  "host_id": 9312
}```

### Response

```Status: 200```
```{"message":"unbind host:9312 of hostgroup: 343"}```
  """
  create_api(:a_host_on_hostgroup, :put, url: ~S</api/v1/hostgroup/host>, need_sig: true)

end
