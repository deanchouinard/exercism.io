defmodule BracketPush do
  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(str) do
    {:ok, stack} = Stack.start_link

    list_graphemes = String.graphemes(str)
    Enum.all?(list_graphemes, &(translate(stack, &1))) and Stack.empty?(stack)
  end

  defp translate(stack, token) do
    case token do
      "{" -> push(stack, "{")
      "[" -> push(stack, "[")
      "(" -> push(stack, "(")
      "}" -> pop(stack, "}")
      "]" -> pop(stack, "]")
      ")" -> pop(stack, ")")
      _ -> true
    end
  end

  defp push(stack, token) do
    Stack.push(stack, token)
  end

  defp pop(stack, token) do
    pop_token = with true <- Stack.size(stack) >= 1,
      pop_token= Stack.pop(stack),
        do: pop_token

    case token do
          "}" -> pop_token == "{"
          "]" -> pop_token == "["
          ")" -> pop_token == "("
        _ -> false
    end
  end

end

defmodule Stack do
  def start_link do
    Agent.start_link(fn -> [] end)
  end

  def pop(pid) do
    Agent.get_and_update(pid, fn [token | tail] -> {token, tail} end)
  end

  def push(pid, token) do
    Agent.update(pid, fn stack -> [token | stack] end)
  end

  def size(pid) do
    Agent.get(pid, fn stack -> Enum.count(stack) end)
  end

  def empty?(pid) do
    Agent.get(pid, fn stack -> Enum.count(stack) == 0 end)
  end

end

