defmodule FalconPlusApi.Api.Get do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required

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
  create_api(:aggreator_by_id, :get, url: ~S</api/v1/aggregators>, need_sig: true)

end
