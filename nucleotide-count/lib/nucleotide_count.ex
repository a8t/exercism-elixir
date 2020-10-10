defmodule NucleotideCount do
  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a DNA strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count(charlist(), char()) :: non_neg_integer()
  def count(strand, nucleotide) do
    strand
    |> histogram
    |> Map.get(nucleotide)
  end

  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram(charlist()) :: map()
  def histogram(strand) do
    strand
    |> Enum.reduce(%{?A => 0, ?C => 0, ?G => 0, ?T => 0}, fn
      nucleotide, acc ->
        current_count = Map.get(acc, nucleotide)

        case current_count do
          0 -> Map.put(acc, nucleotide, 1)
          posInt -> Map.put(acc, nucleotide, posInt + 1)
        end
    end)
  end
end
