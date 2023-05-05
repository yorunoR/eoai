defmodule Eoai.Response do
  require Logger

  def dig(response, keys) when is_list(keys) do
    Enum.reduce_while(keys, response.body, fn key, json ->
      case do_dig(key, json) do
        {:ok, result} ->
          {:cont, result}

        _ ->
          Logger.error("Response format does not match.")
          IO.inspect(response.body)
          {:halt, nil}
      end
    end)
  end

  def dig!(response, keys) when is_list(keys) do
    Enum.reduce(keys, response.body, fn key, json ->
      case do_dig(key, json) do
        {:ok, result} ->
          result

        _ ->
          IO.inspect(response.body)
          raise "Response format does not match."
      end
    end)
  end

  defp do_dig(key, json) when is_map(json) do
    {:ok, Map.get(json, key)}
  end

  defp do_dig(key, json) when is_list(json) do
    {:ok, Enum.at(json, key)}
  end

  defp do_dig(_key, _json) do
    :error
  end
end
