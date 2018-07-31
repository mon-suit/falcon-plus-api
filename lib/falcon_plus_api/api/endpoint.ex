defmodule FalconPlusApi.Api.Endpoint do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    * params:
      * eid: endpoint id list
      * metricQuery: 查询counter参数【选填】。如：metricQuery=device=sda
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
  def counter(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/graph/endpoint_counter>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

end
