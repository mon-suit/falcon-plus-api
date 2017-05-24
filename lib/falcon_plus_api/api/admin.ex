defmodule FalconPlusApi.Api.Admin do
  import FalconPlusApi.Macro

  @doc """
* [Session](#/authentication) Required
* `Admin` usage
* admin:
  * accept option:
    * yes
    * no

### Request
```{"user_id": 14, "admin": "yes"}```

### Response

```Status: 200```
```{"message":"user role update sccuessful, affect row: 1"}```
  """
  create_api(:change_role, :put, url: ~S</api/v1/admin/change_user_role>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* `Admin` usage

### Request
```{"user_id": 14, "password": "newpasswd"}```

### Response

```Status: 200```
```{"message":"password updated!"}```
  """
  create_api(:change_user_passwd, :put, url: ~S</api/v1/admin/change_user_passwd>, need_sig: true)


  @doc """
* [Session](#/authentication) Required
* `Admin` usage

### Request
```{"user_id": 31}```

### Response

```Status: 200```
```{"message":"user 31 has been delete, affect row: 1"}```
  """
  create_api(:delete_user, :delete, url: ~S</api/v1/admin/delete_user>, need_sig: true)

end
