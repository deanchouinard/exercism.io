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
  defp _count([], _), do: 0
  defp _count(chars, nuc) do
    Enum.reduce(chars, 0, fn(c, acc) ->
      cond do
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
    Enum.each(chars, fn(c) ->
      case c do
        ?A -> Map.update(hg
end
