defmodule Bob do
  def hey(input) do
    cond do
      is_silence(input) -> "Fine. Be that way!"
      is_question(input) and is_allcaps(input) -> "Calm down, I know what I'm doing!"
      is_question(input) -> "Sure."
      is_allcaps(input) -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end

  defp is_silence(input) do
    # a string is silence if only whitespace lies between its beginning and end
    String.match?(input, ~r/^[\s]*$/)
  end

  defp is_question(input) do
    # a string is a question if the last non-whitespace character is a question mark
    input
    |> String.trim()
    |> String.last()
    |> String.equivalent?("?")
  end

  defp is_allcaps(input) do
    # a string contains letters if uppercasing and lowercasing produces different strings
    contains_letters = not String.equivalent?(String.upcase(input), String.downcase(input))

    are_all_letters_uppercase = String.equivalent?(input, String.upcase(input))

    # a string is allcaps if it contains letters and all letters are uppercase
    contains_letters and are_all_letters_uppercase
  end
end
