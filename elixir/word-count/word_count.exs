defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do

    String.split(sentence)
    |> IO.inspect
    |> Enum.reduce(%{}, &cnt_word/2)
  end

  def cnt_word(word, word_list) when word !== nil do
    word = clean_word(word)
    case Map.fetch(word_list, word) do
      {:ok, _} ->
        Map.update!(word_list, word, &(&1 + 1))
      :error ->
        # IO.puts "Word: #{inspect word}"
        # IO.puts "Word_list: #{inspect word_list}"
        if String.match?(word, ~r/[\d\w]+/) do
          Map.put(word_list, word, 1)
        else
          word_list
        end
    end
  end
  def cnt_word(_, word_list), do: word_list

  defp clean_word(word) do
    word = String.downcase(word)
    word = String.replace(word, ~r/[\W]/, "")
  end

end
# Words.count("hello")

