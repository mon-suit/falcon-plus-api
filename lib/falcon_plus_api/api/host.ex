defmodule FalconPlusApi.Api.Host do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required

### Request
```
{
    "ids": [1,2,3,4],
    "maintain_begin": 1497951907,
    "maintain_end": 1497951907
}
```
or
```
{
    "hosts": ["host.a","host.b"],
    "maintain_begin": 1497951907,
    "maintain_end": 1497951907
}
```

### Response

```Status: 200```
```{ "message": "Through: hosts, Affect row: 2" }```
  """
  create_api(:maintain, :post, url: ~S</api/v1/host/maintain>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/host/1647/hostgroup
* grp_name: hostgroup name

### Response

```Status: 200```
```[
  {
    "id": 78,
    "grp_name": "tplB",
    "create_user": "userA"
  },
  {
    "id": 145,
    "grp_name": "Owl_Default_Group",
    "create_user": "userA"
  }
]```
  """
  create_api(:related_hostgroup, :get, url: ~S</api/v1/host/#{host_id}/hostgroup>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/host/1647/template
* tpl_name: template name

### Response

```Status: 200```
```[
  {
    "id": 125,
    "tpl_name": "tplA",
    "parent_id": 0,
    "action_id": 99,
    "create_user": "root"
  },
  {
    "id": 142,
    "tpl_name": "tplB",
    "parent_id": 0,
    "action_id": 111,
    "create_user": "root"
  },
  {
    "id": 180,
    "tpl_name": "tplC",
    "parent_id": 0,
    "action_id": 142,
    "create_user": "root"
  }
]```
  """
  create_api(:related_template, :get, url: ~S</api/v1/host/#{host_id}/template>, need_sig: true)


  @doc """
* [Session](#/authentication) Required

### Request
```{"ids": [1,2,3,4]}```
or
```{"hosts": ["host.a","host.b"]}```

### Response

```Status: 200```
```{ "message": "Through: hosts, Affect row: 2" }```
  """
  create_api(:reset, :delete, url: ~S</api/v1/host/maintain>, need_sig: true)

end
