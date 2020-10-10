defmodule RnaTranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RnaTranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna
    |> Enum.map(&translate_nucleotide_to_rna(&1))
  end

  defp translate_nucleotide_to_rna(nucleotide) do
    Map.get(
      %{
        ?G => ?C,
        ?C => ?G,
        ?T => ?A,
        ?A => ?U
      },
      nucleotide
    )
  end
end
