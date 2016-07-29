defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    String.graphemes(string)
    |> enc({"", 1, ""})
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    String.graphemes(string)
    |> dec({"", ""})
  end
  
  def enc([], {current_char, _, _}) when current_char == "", do: ""
  def enc([], {current_char, count, out_str}) do
    out_str <> Integer.to_string(count) <> current_char
  end

  def enc([head | tail], {current_char, count, out_str}) do
    case head == current_char do
      true ->
        count = count + 1
      false ->
        if current_char != "", do: out_str = out_str <> Integer.to_string(count) <> current_char
        current_char = head
        count = 1
    end
    enc(tail, {current_char, count, out_str})
  end
  
  def dec([], {_, out_str}), do: out_str
  def dec([head | tail], {num_str, out_str}) do
    cond do
      String.match?(head, ~r/\d/) ->
        num_str = num_str <> head
      String.match?(head, ~r/[A-Z]/) ->
        num = String.to_integer(num_str)
        out_str = out_str <> expand(head, num, "")
        num_str = ""
    end
    dec(tail, {num_str, out_str})
  end

  defp expand(_, num, str) when num < 1 do
    str
  end
  defp expand(letter, num, str) do
    str = str <> letter
    expand(letter, num - 1, str)
  end
end

