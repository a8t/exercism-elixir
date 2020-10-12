defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  Each verse is in the form of:
  {number of beers on the wall}, {number of beers}.
  {action to do}, {next bottles of beer on the wall}

  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{number_of_beers_on_wall(number)}, #{number_of_beers(number)}.
    #{action(number)}, #{next_number_of_beers_on_wall(number)}.
    """
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(), do: lyrics(99..0)

  def lyrics(range) do
    range
    |> Enum.to_list()
    |> recursive_lyrics()
  end

  defp recursive_lyrics([number]), do: verse(number)
  defp recursive_lyrics([head | tail]), do: verse(head) <> "\n" <> recursive_lyrics(tail)

  @spec number_of_beers_on_wall(number) :: String.t()
  defp number_of_beers_on_wall(0), do: "No more bottles of beer on the wall"
  defp number_of_beers_on_wall(1), do: "1 bottle of beer on the wall"
  defp number_of_beers_on_wall(number), do: "#{number} bottles of beer on the wall"

  defp number_of_beers(0), do: "no more bottles of beer"
  defp number_of_beers(1), do: "1 bottle of beer"
  defp number_of_beers(number), do: "#{number} bottles of beer"

  defp action(0), do: "Go to the store and buy some more"
  defp action(1), do: "Take it down and pass it around"
  defp action(_), do: "Take one down and pass it around"

  defp next_number_of_beers_on_wall(0), do: "99 bottles of beer on the wall"
  defp next_number_of_beers_on_wall(1), do: "no more bottles of beer on the wall"
  defp next_number_of_beers_on_wall(2), do: "1 bottle of beer on the wall"
  defp next_number_of_beers_on_wall(number), do: "#{number - 1} bottles of beer on the wall"
end
