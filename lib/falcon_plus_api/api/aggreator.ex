defmodule FalconPlusApi.Api.Aggreator do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required
* numerator: 分子
* denominator: 分母
* step: 汇报周期（秒为单位）

### Request

```{
  "tags": "",
  "step": 60,
  "numerator": "$(cpu.idle)",
  "metric": "test.idle",
  "hostgroup_id": 343,
  "endpoint": "testenp",
  "denominator": "2"
}```

### Response

```Status: 200```
```{
  "id": 16,
  "grp_id": 343,
  "numerator": "$(cpu.idle)",
  "denominator": "2",
  "endpoint": "testenp",
  "metric": "test.idle",
  "tags": "",
  "ds_type": "GAUGE",
  "step": 60,
  "creator": "root"
}```
  """
  create_api(:create, :get, url: ~S</api/v1/aggregators>, need_sig: true)


  @doc """
* [Session](#/authentication) Required

### Response

```Status: 200```
```{"message":"aggregator:16 is deleted"}```
  """
  create_api(:delete, :delete, url: ~S</api/v1/aggregator/16>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/hostgroup/343/aggregators
* numerator: 分子
* denominator: 分母
* step: 汇报周期（秒为单位）

### Response

```Status: 200```
```[
  {
    "id": 13,
    "grp_id": 343,
    "numerator": "$(cpu.idle)",
    "denominator": "2",
    "endpoint": "testenp",
    "metric": "test.idle",
    "tags": "",
    "ds_type": "GAUGE",
    "step": 60,
    "creator": "root"
  },
  {
    "id": 14,
    "grp_id": 343,
    "numerator": "$(cpu.idle)",
    "denominator": "2",
    "endpoint": "testenp",
    "metric": "test.idle",
    "tags": "",
    "ds_type": "GAUGE",
    "step": 60,
    "creator": "root"
  }
]```
  """
  create_api(:of_hostgroup, :get, url: ~S</api/v1/hostgroup/#{hostgroup_id}/aggregators>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* numerator: 分子
* denominator: 分母
* step: 汇报周期（秒为单位）

### Request

```{
  "tags": "",
  "step": 60,
  "numerator": "$(cpu.idle)",
  "metric": "test.idle",
  "id": 16,
  "endpoint": "testenp",
  "denominator": "$#"
}```

### Response

```Status: 200```
```{
  "id": 16,
  "grp_id": 343,
  "numerator": "$(cpu.idle)",
  "denominator": "$#",
  "endpoint": "testenp",
  "metric": "test.idle",
  "tags": "",
  "ds_type": "GAUGE",
  "step": 60,
  "creator": "root"
}```
  """
  create_api(:update, :put, url: ~S</api/v1/aggregators>, need_sig: true)

end
