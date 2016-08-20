defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    _convert(number, [3, 5, 7], "")
  end

  def _convert(number, [], ""), do: Integer.to_string(number)
  def _convert(_, [], msg), do: msg
  def _convert(number, [head | tail], msg) do
    case rem number, head do
      0 when head == 3 -> msg = msg <> "Pling"
      0 when head == 5 -> msg = msg <> "Plang"
      0 when head == 7 -> msg = msg <> "Plong"
      _ -> msg
    end
    _convert(number, tail, msg)
  end

end
