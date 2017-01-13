defmodule Phone do
  @doc """
  Remove formatting from a phone number.

  Returns "0000000000" if phone number is not valid
  (10 digits or "1" followed by 10 digits)

  ## Examples

  iex> Phone.number("123-456-7890")
  "1234567890"

  iex> Phone.number("+1 (303) 555-1212")
  "3035551212"

  iex> Phone.number("867.5309")
  "0000000000"
  """
  @spec number(String.t) :: String.t
  def number(raw) do
    raw
    |> String.graphemes
    |> Enum.filter(&Regex.match?(~r/[0-9a-z]/, &1))
    |> List.to_string
    |> is_phonenumber
  end

  defp is_phonenumber(phone_string) do
    cond do
      Regex.match?(~r/[a-z]/, phone_string) -> "0000000000"
      String.length(phone_string) == 10 -> phone_string
      String.length(phone_string) == 11 and String.at(phone_string, 0) == "1" ->
        String.slice(phone_string, 1..-1)
      true -> "0000000000"
    end
  end


  @doc """
  Extract the area code from a phone number

  Returns the first three digits from a phone number,
  ignoring long distance indicator

  ## Examples

  iex> Phone.area_code("123-456-7890")
  "123"

  iex> Phone.area_code("+1 (303) 555-1212")
  "303"

  iex> Phone.area_code("867.5309")
  "000"
  """
  @spec area_code(String.t) :: String.t
  def area_code(raw) do
    case String.length(raw) do
      10 -> String.slice(raw, 0..2)
      11 -> String.slice(raw, 1..3)
      _ -> "000"
    end
  end

  @doc """
  Pretty print a phone number

  Wraps the area code in parentheses and separates
  exchange and subscriber number with a dash.

  ## Examples

  iex> Phone.pretty("123-456-7890")
  "(123) 456-7890"

  iex> Phone.pretty("+1 (303) 555-1212")
  "(303) 555-1212"

  iex> Phone.pretty("867.5309")
  "(000) 000-0000"
  """
  @spec pretty(String.t) :: String.t
  def pretty(raw) do
    raw = if String.length(raw) == 11 do
      String.slice(raw, 1..-1)
    else
      raw
    end
    ac = String.slice(raw, 0..2)
    ex = String.slice(raw, 3..5)
    sb = String.slice(raw, 6..9)
    List.to_string( ["(", ac, ")", " ", ex, "-", sb])

  end
end
