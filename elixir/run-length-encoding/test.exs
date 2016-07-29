defmodule Test do

  def start(string) do
    String.graphemes(string)
    |> dec({"", ""})
    # |> enc({"", 1, ""})
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

IO.inspect Test.start("1H2E12W1K")

