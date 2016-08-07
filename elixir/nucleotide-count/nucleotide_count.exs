defmodule DNA do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> DNA.count('AATAA', ?A)
  4

  iex> DNA.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    _count(strand, nucleotide)
  end
  defp _count(_, nuc) when not nuc in @nucleotides, do: raise ArgumentError
  defp _count([], _), do: 0
  defp _count(chars, nuc) do
    Enum.reduce(chars, 0, fn(c, acc) ->
      cond do
        not c in @nucleotides ->
          raise ArgumentError
        c == nuc ->
          acc = acc + 1
        true ->
          acc
      end
    end)
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> DNA.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    hg = %{?A => 0, ?T => 0, ?C => 0, ?G => 0}
    _histogram(strand, hg)
  end
  defp _histogram([], hg), do: hg
  defp _histogram(chars, hg) do
    Enum.reduce(chars, hg, fn(c, hg) ->
      case c do
        ?A -> Map.update!(hg, ?A, &(&1 + 1))
        ?T -> Map.update!(hg, ?T, &(&1 + 1))
        ?C -> Map.update!(hg, ?C, &(&1 + 1))
        ?G -> Map.update!(hg, ?G, &(&1 + 1))
        _ -> raise ArgumentError, message: "invalid argument"
      end
    end)
  end

end
