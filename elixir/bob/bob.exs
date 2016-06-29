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
    # if String.ends_with?(input, "!") or 
    if all_caps(input) do
       true
     else
       false
     end
  end

  defp all_caps(input) do
    input == String.upcase(input)
  end

end
