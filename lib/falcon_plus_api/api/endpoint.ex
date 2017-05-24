defmodule FalconPlusApi.Api.Endpoint do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required
* params:
  * eid: endpoint id list
  * q: 使用 regex 查询字符
    * option 参数

### Response

```Status: 200```
```[
  "disk.io.avgqu-sz/device=sda",
  "disk.io.ios_in_progress/device=sda",
  "disk.io.msec_read/device=sda",
  "disk.io.read_requests/device=sda",
  ...
]```
  """
  create_api(:counter, :get, url: ~S</api/v1/graph/endpoint_counter>, need_sig: true)

end
