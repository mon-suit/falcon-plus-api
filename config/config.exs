use Mix.Config

config :falcon_plus_api, sigs: [
  %{"name" => "root",      "sig" => "server-side-cmcloud-token"},
]

config :falcon_plus_api, addr: %{
  china:  "http://211.159.161.213:8080",
  abroad: "http://falcon-api-363075288.us-west-2.elb.amazonaws.com:8080",
}
#config :falcon_plus_api, sigs: [
#  %{"name" => "root", "sig" => "default-token-used-in-server-side"},
#  %{"name" => "foo",  "sig" => "none_exist_sig"},
#]
#
#
#config :falcon_plus_api, default: :first

#config :falcon_plus_api, addr: %{
#  first:  "127.0.0.1:8080",
#  second: "127.0.0.2:8080",
#}

import_config "#{Mix.env}.exs"
