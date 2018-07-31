defmodule FalconPlusApi.Api.Default do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    透过Session检查去判定使用者可否存取资源
    
    ### RequestHeader
    透过RequestHeader 的 Apitoken做验证
    ```"RequestHeader": {
      "Apitoken": "{\"name\":\"root\",\"sig\":\"427d6803b78311e68afd0242ac130006\"}",
      "X-Forwarded-For": " 127.0.0.1"
    }```
    
    ### Response
    
    Session 为有效
    ```Status: 200```
    ```{"message":"session is vaild!"}```
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def authentication(addr, opts \\ []) do
    ~s</api/v1/user/auth_session>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * q: 使用 regex 查询字符
      * option 参数
    
    
    ### Response
    
    ```Status: 200```
    ```[
      {
        "endpoint": "docker-agent",
        "id": 7
      },
      {
        "endpoint": "docker-task",
        "id": 6
      },
      {
        "endpoint": "graph",
        "id": 3
      },
      {
        "endpoint": "nodata",
        "id": 920
      },
      {
        "endpoint": "task",
        "id": 5
      }
    ]```
  """
  def endpoints(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/graph/endpoint>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * target: grafana query查询串 (type: []string)
      * 支援多组查询条件.
      * ex. ["{host-A}#cpu#idel", "{1.1.1.1,2.2.2.2,3.3.3.3}#cpu#idle"]
      * 為了支援ip & 一些实做的限制. 所以将 "." 制换成 "#"
      * {}# 后面代入的的counter 会作為查询counter的依据. 可以支援regex match. 例如 #.+cpu.+ 会将所有包含cpu字眼的counter一并查询返回数据画图
      * 有时想要找特定的counter可以善用regex语法 "^" or "$" 去限定字串的范围 ex. ["{host-A}#^cpu#idel$"]
      * 这边保留很大的弹性, 有特殊需求的可以自行修改判断逻辑
    * from: start time (unix time)
    * until: end time (unix time)
    * step: 查询graph时, 指定step interval
      * default: 60
    * ConsolFun: 取样 -> ["AVERAGE", "MAX", "MIN"]
      * default: "AVERAGE"
    
    ### Response
    
    ```Status: 200```
    ```[
      {
        "endpoint": "host-A",
        "counter": "cpu.idle",
        "dstype": "GAUGE",
        "step": 60,
        "Values": [
          {
              "timestamp": 1506698040,
              "value": 55.934343
          },
          {
              "timestamp": 1506698100,
              "value": 44.656489
          }
        ]
      }
    ]```
  """
  def grafana(addr, opts \\ []) do
    ~s</v1/grafana/render>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Api.post
    |> Api.get_result
  end

end
