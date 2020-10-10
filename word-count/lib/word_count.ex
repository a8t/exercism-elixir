defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase()
    |> String.split(~r/([_!\s&@$%\^:,])+/, trim: true)
    |> histogram()
  end

  @spec histogram([String.t()]) :: map
  def histogram(words) do
    words
    |> Enum.reduce(%{}, fn
      word, acc ->
        Map.update(acc, word, 1, &(&1 + 1))
    end)
  end
end
