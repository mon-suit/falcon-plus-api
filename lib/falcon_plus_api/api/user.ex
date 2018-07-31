defmodule FalconPlusApi.Api.User do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
  @doc """
    * [Session](#/authentication) Required
    
    ### Request
    ```{
      "new_password": "test1",
      "old_password": "test1"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"password updated!"}```
  """
  def change_password(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/cgpasswd>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    
    ### Request
    ```{"name": "test","password": "test", "email":"xxx@xxx.com", "cnname": "翱鹗"}```
    
    ### Response
    
    ```Status: 200```
    ```{
      "name": "owltester",
      "password": "mypassword",
      "cnname": "翱鹗",
      "email": "root123@cepave.com",
      "im": "44955834958",
      "phone": "99999999999",
      "qq": "904394234239"
    }```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def create(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/create>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * 当前使用者资讯
    
    ### Response
    
    ```Status: 200```
    ```{
      "id": 2,
      "name": "root",
      "cnname": "",
      "email": "",
      "phone": "",
      "im": "",
      "qq": "",
      "role": 2
    }```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def current(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/current>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * `Admin` usage
    * ex. /api/v1/user/u/4
    
    ### Response
    
    ```Status: 200```
    ```{
      "id": 4,
      "name": "userA",
      "cnname": "tear",
      "email": "",
      "phone": "",
      "im": "",
      "qq": "",
      "role": 0
    }```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def get_info_by_id(user_id, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/u/#{user_id}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * `Admin` usage
    * ex. /api/v1/user/name/laiwei
    
    ### Response
    
    ```Status: 200```
    ```
    {
        "cnname": "laiwei8",
        "email": "laiwei8@xx",
        "id": 8,
        "im": "",
        "name": "laiwei8",
        "phone": "",
        "qq": "",
        "role": 0
    }```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def get_info_by_name(user_name, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/name/#{user_name}>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/user/u/4/teams
    
    ### Response
    
    ```Status: 200```
    ```{"teams":
      [{
        "id":3,
        "name":"root",
        "resume":"",
        "creator":5},
       {"id":32,
        "name":"testteam",
        "resume":"test22",
        "creator":5
       }]
    } ```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def get_teams(uid, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/u/#{uid}/teams>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * ex. /api/v1/user/u/4/in_teams?team_names=team1,team4
    
    ### Request
    Content-type: application/x-www-form-urlencoded
    ```team_names=team1,team2```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"true"} ```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def is_in_teams(uid, sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/u/#{uid}/in_teams>
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
        "id": 1,
        "name": "root",
        "cnname": "",
        "email": "",
        "phone": "",
        "im": "",
        "qq": "904394234239",
        "role": 2
      },
      {
        "id": 32,
        "name": "owltester",
        "cnname": "翱鶚",
        "email": "root123@cepave.com",
        "phone": "99999999999",
        "im": "44955834958",
        "qq": "904394234239",
        "role": 0
      }
    ]```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def list(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/users>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    使用者登入
    
    ### Request
    ```{
      "name": "test2",
      "password": "test2"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{
      "sig": "9d791331c0ea11e690c5001500c6ca5a",
      "name": "test2",
      "admin": false
    }```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def login(addr, opts \\ []) do
    ~s</api/v1/user/login>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Api.post
    |> Api.get_result
  end

  @doc """
    使用者登出
    * [Session](#/authentication) Required
    
    ### Response
    
    Sends back a collection of things.
    
    ```Status: 200```
    ```{"message":"logout successful"}```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def logout(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/logout>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.get
    |> Api.get_result
  end

  @doc """
    更新使用者
    * [Session](#/authentication) Required
    
    ### Request
    ```{
      "name": "test1",
      "cnname": "翱鶚Test",
      "email": "root123@cepave.com",
      "im": "44955834958",
      "phone": "99999999999",
      "qq": "904394234239"
    }```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"user info updated"}```
    
    For more example, see the [user](/doc/user.html).
    
    For errors responses, see the [response status codes documentation](#/response-status-codes).
  """
  def update(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/user/update>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

end
