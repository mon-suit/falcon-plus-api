use Mix.Config

config :falcon_plus_api, sigs: [
  %{"name" => "root", "sig" => "default-token-used-in-server-side"},
  %{"name" => "foo",  "sig" => "none_exist_sig"},
]

config :falcon_plus_api, debug: true

config :falcon_plus_api, default: :first

config :falcon_plus_api, addr: %{
  first:  "127.0.0.1:8080",
  second: "127.0.0.2:8080",
}
