defmodule FalconPlusApi.Api.Metric do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
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
  def tmplist(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/metric/default_list>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

end
