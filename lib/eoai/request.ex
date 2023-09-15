defmodule Eoai.Request do
  alias __MODULE__

  def call(client, request, params) do
    call(client, request, params, nil)
  end

  def call(client, request, %{} = params, callback) do
    case request do
      :chat ->
        Request.Chat.run(client, params, func_to_parse_stream(callback))

      :embeddings ->
        Request.Embeddings.run(client, params)

      _ ->
        "Undefined request"
    end
  end

  def call(_client, _request, _params, _callback) do
    "Invalid parameters"
  end

  defp func_to_parse_stream(callback) do
    func = fn {:data, data}, {req, resp} ->
      data
      |> String.split("\n")
      |> Enum.filter(fn line ->
        String.starts_with?(line, "data: {")
      end)
      |> Enum.map(fn line ->
        line
        |> String.replace_prefix("data: ", "")
        |> Jason.decode!()
        |> callback.()
      end)

      {:cont, {req, resp}}
    end

    func
  end
end
