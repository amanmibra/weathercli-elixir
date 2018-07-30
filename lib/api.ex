defmodule API do
  require APIConfig
  require HTTPoison

  def test do
    IO.puts "test"
  end

  def currently(zip) do
    url = "http://api.apixu.com/v1/current.json?key=#{APIConfig.key}&q=#{zip}"

    body = process_response_body HTTPoison.get!(url).body
    location = body[:location]
    current = body[:current]

    IO.puts("The current weather in #{location["name"]}, #{location["region"]} in #{location["country"]} is about #{current["temp_f"]} degress Fareinheit.")
  end

  defp process_response_body(body) do
    body
    |> Poison.decode!
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
  end
end
