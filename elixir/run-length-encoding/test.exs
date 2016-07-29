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

  def dec([head | tail], {num_str, out_str) do
    cond do
      String.match?(head, ~r/\d/) ->
        num_str = num_str <> head
      String.match?(head, ~r/[A-Z]/) ->
        out_str = out_str <> expand(num_str, head)
        num_str = ""
    end
    dec(tail, {num_str, out_str})
  end

      
    cur_str = cur_str <> head
    case String.match?(cur_str, ~r/\d+[A-Z]/) do
      true ->

    #String.split(string, ~r/\d+[A-Z]/)
    #String.split(string, ~r/(?=[\d+][A-Z])/)
    String.split(string, ~r/(?=[A-Z]\d+)/)
  end
end

IO.inspect Test.dec("1H2E12W1K")

