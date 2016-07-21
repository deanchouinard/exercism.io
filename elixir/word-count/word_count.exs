defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    String.split(sentence, [" ", "_"])
    |> Stream.filter(fn(word) -> String.match?(word, ~r/[\d\w]+/) end)
    |> Stream.map(fn(word) -> String.downcase(word) end)
    |> Stream.map(fn(word) -> String.replace(word, ~r/[^-\w]/u, "") end)
    |> Enum.reduce(%{}, fn(word, word_list) -> Map.update(word_list, 
                          word, 1, &(&1 + 1)) end)
  end
end

