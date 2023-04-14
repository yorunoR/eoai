# Eoai

Elixir OpenAI API Client

**Under development**

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `eoai` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:eoai, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/eoai>.

## Setup

Prepare configuration file `config/config.exs`.

```elixir
import Config

config :eoai,
  api_key: "your-api-key",
  organization_key: "your-organization-key" # option
```

## Example

```elixir
params = %{
  model: "gpt-3.5-turbo",
  messages: [
    %{role: "user", content: "Hello!"}
  ]
}

Eoai.Client.new()
|> Eoai.Request.call(:chat, params)
|> Eoai.Response.dig(["choices", 0, "message", "content"])
```
