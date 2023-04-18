defmodule Eoai.Request do
  alias __MODULE__

  def call(client, request, %{} = params) do
    case request do
      :chat ->
        Request.Chat.run(client, params)

      :embeddings ->
        Request.Embeddings.run(client, params)

      _ ->
        "Undefined request"
    end
  end

  def call(_client, _request, _params) do
    "Invalid parameters"
  end
end
