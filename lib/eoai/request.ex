defmodule Eoai.Request do
  def call(client, request, %{} = params) do
    case request do
      :chat ->
        __MODULE__.Chat.run(client, params)

      _ ->
        "Undefined request"
    end
  end

  def call(_client, _request, _params) do
    "Invalid parameters"
  end
end
