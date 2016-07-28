defmodule Test do

  def start(string) do
    String.graphemes(string)
    |> enc({"", 1, ""})
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

IO.puts Test.start("")

