defmodule FalconPlusApi.Api.Nodata do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required

### Request

```{
  "tags": "",
  "step": 60,
  "obj_type": "host",
  "obj": "docker-agent",
  "name": "testnodata",
  "mock": -1,
  "metric": "test.metric",
  "dstype": "GAUGE"
}```

### Response

```Status: 200```
```{
  "id": 4,
  "name": "testnodata",
  "obj": "docker-agent",
  "obj_type": "host",
  "metric": "test.metric",
  "tags": "",
  "dstype": "GAUGE",
  "step": 60,
  "mock": -1,
  "creator": "root"
}```
  """
  create_api(:create, :post, url: ~S</api/v1/nodata/>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/nodata/4

### Response

```Status: 200```
```{"message":"mockcfg:4 is deleted"}```
  """
  create_api(:delete, :delete, url: ~S</api/v1/nodata/#{nodata_id}>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/nodata/2

### Response

```Status: 200```
```{
  "id": 2,
  "name": "owl_nodate",
  "obj": "docker-agent",
  "obj_type": "host",
  "metric": "test.metric",
  "tags": "",
  "dstype": "GAUGE",
  "step": 60,
  "mock": -2,
  "creator": "root"
}```
  """
  create_api(:info_by_id, :get, url: ~S</api/v1/nodata/#{nodata_id}>, need_sig: true)


  @doc """
* [Session](#/authentication) Required

### Response

```Status: 200```
```[
  {
    "id": 2,
    "name": "owl_nodate",
    "obj": "docker-agent",
    "obj_type": "host",
    "metric": "test.metric",
    "tags": "",
    "dstype": "GAUGE",
    "step": 60,
    "mock": -2,
    "creator": "root"
  }
]```
  """
  create_api(:list, :get, url: ~S</api/v1/nodata>, need_sig: true)


  @doc """
* [Session](#/authentication) Required

### Request

```{
  "tags": "",
  "step": 60,
  "obj_type": "host",
  "obj": "docker-agent",
  "mock": -2,
  "metric": "test.metric",
  "id": 4,
  "dstype": "GAUGE"
}```

### Response

```Status: 200```
```{
  "id": 0,
  "name": "",
  "obj": "docker-agent",
  "obj_type": "host",
  "metric": "test.metric",
  "tags": "",
  "dstype": "GAUGE",
  "step": 60,
  "mock": -2,
  "creator": ""
}```
  """
  create_api(:update, :put, url: ~S</api/v1/nodata/>, need_sig: true)

end
