defmodule FalconPlusApi.Api.Nodata do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
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
  def create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/nodata/>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/nodata/4
    
    ### Response
    
    ```Status: 200```
    ```{"message":"mockcfg:4 is deleted"}```
  """
  def delete(nodata_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/nodata/#{nodata_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

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
  def info_by_id(nodata_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/nodata/#{nodata_id}>
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
  def list(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/nodata>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

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
  def update(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/nodata/>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

end
