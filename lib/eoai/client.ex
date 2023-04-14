defmodule Eoai.Client do
  alias Eoai.Config

  def new(opts \\ []) do
    api_key = opts |> Keyword.get(:api_key, Config.api_key())
    base_url = opts |> Keyword.get(:base_url, Config.base_url())
    receive_timeout = opts |> Keyword.get(:receive_timeout, 30_000)

    Req.new(
      base_url: base_url,
      auth: {:bearer, api_key},
      receive_timeout: receive_timeout
    )
  end
end
