defmodule FalconPlusApi.Macro do
  require Logger

  def handle_response(res) do

    if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api response #{res |> inspect |> String.slice(1, 200)}"

    case res do
      {:ok, %{status_code: 200, body: body}} -> 

        if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api response, code: 200, body: #{body |> inspect |> String.slice(1, 200)}"
        {:ok, Poison.decode!(body)}

      {:ok, %{status_code: code, body: body}} -> 
        
        if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api response, code: #{code}, body: #{body |> inspect |> String.slice(1, 200)}"
        {:error, Poison.decode!(body)}

      other -> 
         
        if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api response fail, reason: #{other |> inspect}"
        other
    end
  end

  defmacro create_api(name, type, url: url, need_sig: need_sig) do

    quote bind_quoted: [name: name, type: type, url: url, need_sig: need_sig] do

      require Logger
      
      @api_pool  [hackney: [pool: :falcon_plus_api]]

      if need_sig == true do

        if type == :get or type == :delete do

          if url =~ ~R/#\{.+\}/ do

            #need_sig: true, type: get, url_need_param: true
            def unquote(name)(sig, param, addr \\ nil, options \\ []) do
              sig = FalconPlusApi.Sig.get_sig(sig)
              new_url = FalconPlusApi.Util.url_with_params(unquote(url), param, addr)

              if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api url: #{new_url}"
              headers = [{"Apitoken", sig}]
              response = HTTPoison.request(unquote(type), new_url, "", headers, options ++ @api_pool)
              FalconPlusApi.Macro.handle_response(response)
            end

          else

            #need_sig: true, type: get, url_need_param: false
            def unquote(name)(sig, addr \\ nil, options \\ []) do
              sig = FalconPlusApi.Sig.get_sig(sig)
              new_url = FalconPlusApi.Util.url(unquote(url), addr)

              if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api url: #{new_url}"
              headers = [{"Apitoken", sig}]
              response = HTTPoison.request(unquote(type), new_url, "", headers, options ++ @api_pool)
              FalconPlusApi.Macro.handle_response(response)
            end

          end


        else

          if url =~ ~R/#\{.+\}/ do

            #need_sig: true, type: other, url_need_param: true
            def unquote(name)(sig, url_param, post_param, addr \\ nil, options \\ []) do
              sig = FalconPlusApi.Sig.get_sig(sig)
              new_url = FalconPlusApi.Util.url_with_params(unquote(url), url_param, addr)

              if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api url: #{new_url}"
              if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api param: #{inspect post_param}"
              headers = [{"Apitoken", sig},{"Content-Type", "application/json"}]
              body = Poison.encode!(post_param)
              response = HTTPoison.request(unquote(type), new_url, body, headers, options ++ @api_pool)
              FalconPlusApi.Macro.handle_response(response)
            end
            
          else
            #need_sig: true, type: other, url_need_param: false
            def unquote(name)(sig, post_param, addr \\ nil, options \\ []) do
              sig = FalconPlusApi.Sig.get_sig(sig)
              new_url = FalconPlusApi.Util.url(unquote(url), addr)

              if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api url: #{new_url}"
              if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api param: #{inspect post_param}"
              headers = [{"Apitoken", sig},{"Content-Type", "application/json"}]
              body = Poison.encode!(post_param)
              response = HTTPoison.request(unquote(type), new_url, body, headers, options ++ @api_pool)
              FalconPlusApi.Macro.handle_response(response)
            end
            
          end

        end


      else

        #need_sig: false, type: other, url_need_param: false
        def unquote(name)( post_param, addr \\ nil, options \\ []) do
          new_url = FalconPlusApi.Util.url(unquote(url), addr)

          if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api url: #{new_url}"
          if Application.get_env(:falcon_plus_api, :debug), do: Logger.info "Api param: #{inspect post_param}"
          body = Poison.encode!(post_param)
          response = HTTPoison.request(unquote(type), new_url, body, [], options ++ @api_pool)
          FalconPlusApi.Macro.handle_response(response)
        end
      end

    end

  end
end
