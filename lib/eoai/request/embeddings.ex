defmodule Eoai.Request.Embeddings do
  def run(client, json) do
    Req.post!(client, url: "/embeddings", json: json)
  end
end
