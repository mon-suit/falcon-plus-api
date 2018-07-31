# Falcon Plus Api

[OpenFalcon Plus](https://github.com/open-falcon/falcon-plus) Api. Generate from its doc.

## Installation

```elixir
def deps do
  [{:falcon_plus_api, "~> 1.0.0"}]
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

## How to use

```elixir
#see help
h FalconPlusApi.Api.User.list

#list user from default address with root's token
{:ok, users} = FalconPlusApi.Api.User.list("root", :first)

#list user from second address with root's token
{:ok, users} = FalconPlusApi.Api.User.list("root", :second)

#list user from second address with foo's token
{:ok, users} = FalconPlusApi.Api.User.list("foo", :second)

# /api/v1/team?q=a.+
{:ok, teams} = FalconPlusApi.Api.Team.list("root", :first, query: %{"q" => "a.+"})

# /api/v1/hostgroup/#{hostgroup_id}
h FalconPlusApi.Api.Hostgroup.get_info_by_id
FalconPlusApi.Api.Hostgroup.get_info_by_id(3221, "root", :first)
```
## Generate Script

You can generate api by your self.

Run script and specify falcon plus root dir by passing `FALCON_PLUS` envirenment.
```bash
FALCON_PLUS=SOME_PATH/falcon-plus perl ./script/gen.pl
```

