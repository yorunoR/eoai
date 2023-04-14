defmodule Eoai.Request.Chat do
  def run(client, json) do
    Req.post!(client, url: "/chat/completions", json: json)
  end
end
