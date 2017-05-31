# Falcon Plus Api

[OpenFalcon Plus](https://github.com/open-falcon/falcon-plus) Api. Generate from its doc.

## Installation

```elixir
def deps do
  [{:falcon_plus_api, "~> 0.1.0"}]
end
```

## Config

### Token

```elixir

#Set some tokens

config :falcon_plus_api, sigs: [
  %{"name" => "root", "sig" => "default-token-used-in-server-side"},
  %{"name" => "foo",  "sig" => "none_exist_sig"},
]

#Also can add token like this
FalconPlusApi.Sig.add_sig(%{"name" => "bar", "sig" => "bar's token"})

```

### Address

```elixir
config :falcon_plus_api, addr: %{
  first:  "127.0.0.1:8080",
  second: "127.0.0.2:8080",
}

#Set Default Address
config :falcon_plus_api, default: :first
```

### Debug

```elixir

config :falcon_plus_api, debug: true

```

## How to use

```elixir
#see help
h FalconPlusApi.Api.User.list

#list user from default address with root's token
FalconPlusApi.Api.User.list("root")

#list user from second address with root's token
FalconPlusApi.Api.User.list("root", :second)

#list user from second address with foo's token
FalconPlusApi.Api.User.list("foo", :second)

# /api/v1/team?q=a.+
FalconPlusApi.Api.Team.list("foo", nil, params: [{"q", "a.+"}]) 

# /api/v1/hostgroup/#{hostgroup_id}
FalconPlusApi.Api.Hostgroup.get_info_by_id("foo", %{"hostgroup_id" => 3221})
```
