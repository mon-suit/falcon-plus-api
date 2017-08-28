defmodule FalconPlusApi.Api.User do
  import FalconPlusApi.Macro

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
  create_api(:change_password, :put, url: ~S</api/v1/user/cgpasswd>, need_sig: true)


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
  create_api(:create, :post, url: ~S</api/v1/user/create>, need_sig: true)


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
  create_api(:current, :get, url: ~S</api/v1/user/current>, need_sig: true)


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
  create_api(:get_info_by_id, :get, url: ~S</api/v1/user/u/#{user_id}>, need_sig: true)


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
  create_api(:get_info_by_name, :get, url: ~S</api/v1/user/name/#{user_name}>, need_sig: true)


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
  create_api(:get_teams, :get, url: ~S</api/v1/user/u/#{uid}/teams>, need_sig: true)


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
  create_api(:is_in_teams, :get, url: ~S</api/v1/user/u/#{uid}/in_teams>, need_sig: true)


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
  create_api(:list, :get, url: ~S</api/v1/user/users>, need_sig: true)


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
  create_api(:login, :post, url: ~S</api/v1/user/login>, need_sig: false)


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
  create_api(:logout, :get, url: ~S</api/v1/user/logout>, need_sig: true)


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
  create_api(:update, :put, url: ~S</api/v1/user/update>, need_sig: true)

end
