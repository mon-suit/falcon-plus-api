defmodule FalconPlusApi.Api.Metric do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required
* Metric Suggestion for create strategy
* base on `./data/metric` file

### Response

```Status: 200```
```[
  "cpu.busy",
  "cpu.cnt",
  "cpu.guest",
  "cpu.idle",
  "cpu.iowait",
  "cpu.irq",
  "cpu.nice",
  "cpu.softirq",
  "cpu.steal",
  "cpu.system",
  "cpu.user",
  "df.bytes.free",
  "df.bytes.free.percent"
  ....
]```
  """
  create_api(:tmplist, :get, url: ~S</api/v1/metric/tmplist>, need_sig: true)

end
