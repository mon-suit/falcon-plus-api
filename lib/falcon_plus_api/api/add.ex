defmodule FalconPlusApi.Api.Add do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required
* Hosts 每次会覆盖该HostGroup内现有的Host List
* 如果使用者不是 Admin 只能对创建的hostgroup做操作

### Request
```{
  "hosts": [
    "testhostgroup",
    "agent_test"
  ],
  "hostgroup_id": 343
}```

### Response

```Status: 200```
```{"message":"[9312 9313] bind to hostgroup: 343"}```
  """
  create_api(:host_to_hostgroup, :post, url: ~S</api/v1/hostgroup/host>, need_sig: true)

end
