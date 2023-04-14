defmodule Eoai.Config do
  @v1_base_url "https://api.openai.com/v1"

  def base_url, do: @v1_base_url
  def api_key, do: get_config_value(:api_key)
  def organization_key, do: get_config_value(:organization_key)

  defp get_config_value(key) do
    Application.get_env(:eoai, key, nil)
  end
end
