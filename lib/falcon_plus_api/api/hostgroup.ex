defmodule FalconPlusApi.Api.Hostgroup do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required
ex. /api/v1/hostgroup/343
* 如果使用者不是 Admin 只能对创建的hostgroup做操作

### Response

```Status: 200```
```{"message":"hostgroup:343 has been deleted"}```
  """
  create_api(:delete, :delete, url: ~S</api/v1/hostgroup/#{hostgroup_id}>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/hostgroup/343

### Response

```Status: 200```
```{
  "hostgroup": {
    "id": 343,
    "grp_name": "testhostgroup",
    "create_user": "root"
  },
  "hosts": [
    {
      "id": 9313,
      "hostname": "agent_test",
      "ip": "",
      "agent_version": "",
      "plugin_version": "",
      "maintain_begin": 0,
      "maintain_end": 0
    }
  ]
}```
  """
  create_api(:get_info_by_id, :get, url: ~S</api/v1/hostgroup/#{hostgroup_id}>, need_sig: true)


  @doc """
* [Session](#/authentication) Required

### Response

```Status: 200```
```[
  {
    "id": 3,
    "grp_name": "docker-A",
    "create_user": "user-A"
  },
  {
    "id": 5,
    "grp_name": "docker-T",
    "create_user": "user-B"
  },
  {
    "id": 8,
    "grp_name": "docker-F",
    "create_user": "root"
  }
]```
  """
  create_api(:list, :get, url: ~S</api/v1/hostgroup/>, need_sig: true)


  @doc """
* [Session](#/authentication) Required

### Request

```{
  "tpl_id": 5,
  "grp_id": 3
}```

### Response

```Status: 200```
```{"grp_id":3,"tpl_id":5,"bind_user":2}```
  """
  create_api(:template_bind, :post, url: ~S</api/v1/hostgroup/template>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/hostgroup/3/template

### Response

```Status: 200```
```{
  "hostgroup": {
    "id": 3,
    "grp_name": "hostgroupA",
    "create_user": "root"
  },
  "templates": [
    {
      "id": 5,
      "tpl_name": "TplA",
      "parent_id": 0,
      "action_id": 12,
      "create_user": "root"
    },
    {
      "id": 91,
      "tpl_name": "TplB",
      "parent_id": 0,
      "action_id": 59,
      "create_user": "userA"
    },
    {
      "id": 94,
      "tpl_name": "TplB",
      "parent_id": 0,
      "action_id": 62,
      "create_user": "userA"
    },
    {
      "id": 103,
      "tpl_name": "TplC",
      "parent_id": 0,
      "action_id": 74,
      "create_user": "root"
    },
    {
      "id": 104,
      "tpl_name": "TplD",
      "parent_id": 0,
      "action_id": 75,
      "create_user": "root"
    },
    {
      "id": 105,
      "tpl_name": "TplE",
      "parent_id": 0,
      "action_id": 76,
      "create_user": "root"
    },
    {
      "id": 116,
      "tpl_name": "TplG",
      "parent_id": 0,
      "action_id": 87,
      "create_user": "root"
    },
    {
      "id": 125,
      "tpl_name": "TplH",
      "parent_id": 0,
      "action_id": 99,
      "create_user": "root"
    },
    {
      "id": 126,
      "tpl_name": "http",
      "parent_id": 0,
      "action_id": 100,
      "create_user": "root"
    },
    {
      "id": 127,
      "tpl_name": "TplJ",
      "parent_id": 0,
      "action_id": 101,
      "create_user": "root"
    }
  ]
}```
  """
  create_api(:template_list, :get, url: ~S</api/v1/hostgroup/#{hostgroup_id}/template>, need_sig: true)


  @doc """
* [Session](#/authentication) Required

### Request

```{
  "tpl_id": 5,
  "grp_id": 3
}```

### Response

```Status: 200```
```{"message":"template: 5 is unbind of HostGroup: 3"}```
  """
  create_api(:template_unbind, :put, url: ~S</api/v1/hostgroup/template>, need_sig: true)

end
