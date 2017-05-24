defmodule FalconPlusApi.Api.Plugin do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required
* grp_id: hostgroup id

### Request

```{
  "hostgroup_id": 343,
  "dir_path": "testpath"
}```

### Response

```Status: 200```
```{
  "id": 1501,
  "grp_id": 343,
  "dir": "testpath",
  "create_user": "root"
}```
  """
  create_api(:create, :post, url: ~S</api/v1/plugin>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/plugin/1501

### Response

```Status: 200```
```{"message":"plugin:1501 is deleted"}```
  """
  create_api(:delete, :delete, url: ~S</api/v1/plugin/#{plugin_id}>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/hostgroup/343/plugins
* grp_id: hostgroup id

### Response

```Status: 200```
```[
  {
    "id": 1499,
    "grp_id": 343,
    "dir": "testpath",
    "create_user": "root"
  },
  {
    "id": 1501,
    "grp_id": 343,
    "dir": "testpath",
    "create_user": "root"
  }
]```
  """
  create_api(:info_by_id, :get, url: ~S</api/v1/hostgroup/#{hostgroup_id}/plugins>, need_sig: true)

end
