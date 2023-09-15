defmodule Eoai.Request.Chat do
  def run(client, %{stream: true} = json, func_to_parse_stream) do
    Req.post!(client, url: "/chat/completions", json: json, into: func_to_parse_stream)
  end

  def run(client, json, _func_to_parse_stream) do
    Req.post!(client, url: "/chat/completions", json: json)
  end
end
