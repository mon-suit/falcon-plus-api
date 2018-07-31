defmodule FalconPlusApi.Api.Get do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
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
  def aggreator_by_id(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/aggregators>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

end
