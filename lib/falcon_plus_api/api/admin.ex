defmodule FalconPlusApi.Api.Admin do
  alias Maxwell.Conn
  alias FalconPlusApi.{Util, Sig, Api}
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
  def change_role(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/admin/change_user_role>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * `Admin` usage
    
    ### Request
    ```{"user_id": 14, "password": "newpasswd"}```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"password updated!"}```
  """
  def change_user_passwd(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/admin/change_user_passwd>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.put
    |> Api.get_result
  end

  @doc """
    * [Session](#/authentication) Required
    * `Admin` usage
    
    ### Request
    ```{"user_id": 31}```
    
    ### Response
    
    ```Status: 200```
    ```{"message":"user 31 has been delete, affect row: 1"}```
  """
  def delete_user(sig, addr, opts \\ []) do
    sig = Sig.get_sig(sig)
    ~s</api/v1/admin/delete_user>
    |> Util.url(addr)
    |> Conn.new()
    |> Api.set_opts(opts)
    |> Conn.put_req_header("Apitoken", sig)
    |> Api.delete
    |> Api.get_result
  end

end
