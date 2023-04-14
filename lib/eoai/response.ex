defmodule Eoai.Response do
  def dig(response, keys) when is_list(keys) do
    Enum.reduce(keys, response.body, fn key, json ->
      do_dig(key, json)
    end)
  end

  defp do_dig(key, json) when is_map(json) do
    Map.get(json, key)
  end

  defp do_dig(key, json) when is_list(json) do
    Enum.at(json, key)
  end
end
