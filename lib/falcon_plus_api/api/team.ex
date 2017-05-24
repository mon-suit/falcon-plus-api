defmodule FalconPlusApi.Api.Team do
  import FalconPlusApi.Macro

  @doc """
新增使用者群組
* [Session](#/authentication) Required
* users: 属於该群组的user id list
* resume: team的描述

### Request
```{"team_name": "ateamname","resume": "i'm descript", "users": [1]}```

### Response

```Status: 200```
```{"message":"team created! Afftect row: 1, Affect refer: 1"}```
  """
  create_api(:create, :post, url: ~S</api/v1/team>, need_sig: true)


  @doc """
新增使用者群組
* [Session](#/authentication) Required
* ex. /api/v1/team/107
* 除Admin外, 使用者只能更新自己创建的team

### Response

```Status: 200```
```{"message":"team 107 is deleted. Affect row: 1 / refer delete: 4"}```
  """
  create_api(:delete_by_id, :delete, url: ~S</api/v1/team/#{team_id}>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/team/t/107

### Response

```Status: 200```
```{
  "id": 107,
  "name": "ateamname",
  "resume": "i'm descript",
  "creator": 1,
  "users": [
    {
      "id": 4,
      "name": "test1",
      "cnname": "翱鶚Test",
      "email": "root123@cepave.com",
      "phone": "99999999999",
      "im": "44955834958",
      "qq": "904394234239",
      "role": 0
    },
    {
      "id": 7,
      "name": "cepave1",
      "cnname": "",
      "email": "",
      "phone": "",
      "im": "",
      "qq": "904394234239",
      "role": 0
    }
  ]
}```
  """
  create_api(:info_by_id, :get, url: ~S</api/v1/team/t/#{team_id}>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* ex. /api/v1/team/name/plus-dev

### Response

```Status: 200```
```
{
    "creator": 6,
    "creator_name": "",
    "id": 10,
    "name": "plus-dev",
    "resume": "test intro",
    "users": [
        {
            "cnname": "laiwei",
            "email": "laiwei@xxx.com",
            "id": 1,
            "im": "yyyyx",
            "name": "laiwei1",
            "phone": "15011518472",
            "qq": "3805112124444455",
            "role": 2
        }
    ]
}```
  """
  create_api(:info_by_name, :get, url: ~S</api/v1/team/name/#{team_name}>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* q: 使用 regex 查询字符, 查询team name
  * option 参数

### Request
```q=a.+```

### Response

```Status: 200```
```[
  {
    "id": 1,
    "name": "a",
    "resume": "",
    "creator": 1
  },
  {
    "id": 5,
    "name": "atestteam",
    "resume": "i'm test",
    "creator": 16
  },
  {
    "id": 107,
    "name": "ateamname",
    "resume": "i'm descript",
    "creator": 1
  }
]```
  """
  create_api(:list, :get, url: ~S</api/v1/team>, need_sig: true)


  @doc """
更新使用者群組
* [Session](#/authentication) Required
* users: 属於该群组的user id list
* resume: team的描述
* 除Admin外, 使用者只能更新自己创建的team

### Request
```{
  "team_id": 107,
  "resume": "i'm descript update",
  "users": [4,5,6,7]
}```

### Response

```Status: 200```
```{"message":"team updated!"}```
  """
  create_api(:update, :put, url: ~S</api/v1/team>, need_sig: true)

end
