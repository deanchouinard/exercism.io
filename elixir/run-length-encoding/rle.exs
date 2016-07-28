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
end

  # defp rle(c, out) when not null(c) do
  #   case String.last(out) == c do
  #     true ->
  #       len = String.length(out)
  #       count = String.to_integer(String.slice(len - 1, 1))
  #
  #     false ->
  #       out <> "1" <> c
  # end
  #
  # defp rle(_, out), do: out
  #
  #
  # enc(graphemes) do
  #   current_letter
  #   count
  #   str
  #   enc2(cu
  #
  #   2 sum functions
  #   first sums/builds output string
  #     second sums each letter
  #       when letter is same add 1
  #
  # def enc(graphemes), do: _enc(graphemes, "")
  # defp _enc([head | tail], oustr) do
  #   _enc(tail, head <> oustr)
  # end
  #

