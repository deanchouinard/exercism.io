defmodule Bob do
  def hey(input) do
    cond do
      silence(input) -> "Fine. Be that way!"
      asking_question(input) -> "Sure."
      shouting(input) -> "Whoa, chill out!"
        true -> "Whatever."

    end
  end

  defp silence(input) do
    String.strip(input) == ""
  end

  defp asking_question(input) do
    if String.ends_with?(input, "?") do
      true
    else
      false
    end
  end

  defp shouting(input) do
    if all_caps(input) and contains_char(input) do
    # and not String.match?(input, ~r/[0-9]/) do
      true
    else
      # if String.ends_with?(input, "!") do
      #   true
      # else
      #   false
      # end
      false
    end
  end

  defp all_caps(input) do
    input == String.upcase(input)
  end

  defp just_numbers(input) do
    String.graphemes(input)
    |> Enum.find(false, fn(x) -> String.match?(x, ~r/[0-9]/) end)
  end

  defp contains_char(input) do
    String.graphemes(input)
    |> Enum.find(false, fn(x) -> String.match?(x, ~r/[a-zA-Z]/) end)
  end

end
