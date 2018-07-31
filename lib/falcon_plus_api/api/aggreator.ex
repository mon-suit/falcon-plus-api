defmodule FalconPlusApi.Api.Aggreator do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
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
  def create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/aggregators>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    
    ### Response
    
    ```Status: 200```
    ```{"message":"aggregator:16 is deleted"}```
  """
  def delete(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/aggregator/16>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

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
  def of_hostgroup(hostgroup_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/hostgroup/#{hostgroup_id}/aggregators>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

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
  def update(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/aggregators>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

end
