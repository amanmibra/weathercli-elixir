defmodule WeatherCLI do
  @moduledoc """
  Documentation for Weathercli.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Weathercli.hello
      :world

  """
  def main(argv) do
    IO.inspect(argv)
  end
end
