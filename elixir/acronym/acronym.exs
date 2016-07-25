defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string)
    #    |> Enum.each(&(String.split(&1, ~r/(?=[A-Z])/)))
    |> IO.inspect
    |> Enum.reduce("", fn(x, abv) -> abv <> String.upcase(String.first(x)) end)
  end
end
