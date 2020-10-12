defmodule RotationalCipher do
  @alphabet_length 26
  @upper ?A..?Z
  @lower ?a..?z

  @doc """
  Given a plaintext and amount to shift by, return a rotated string.

  Example:
  iex> RotationalCipher.rotate("Attack at dawn", 13)
  "Nggnpx ng qnja"
  """
  @spec rotate(text :: String.t(), shift :: integer) :: String.t()
  def rotate(text, shift) do
    text
    |> to_charlist()
    |> Enum.map(&rotate_char(&1, shift))
    |> to_string()
  end

  defp rotate_char(char, shift) when char in @upper, do: rotate_letter(char, shift, ?A)
  defp rotate_char(char, shift) when char in @lower, do: rotate_letter(char, shift, ?a)
  defp rotate_char(char, _shift), do: char

  # for uppercase and lowercase letters:
  # - "zero" the char by subtracting codepoint ?A or ?a respectively
  # - add the shift
  # - modulo by @alphabet_length
  # - add back the original "zeroing" codepoint ?A or ?a
  defp rotate_letter(char, shift, zeroing_codepoint) do
    char
    |> Kernel.-(zeroing_codepoint)
    |> Kernel.+(shift)
    |> Kernel.rem(@alphabet_length)
    |> Kernel.+(zeroing_codepoint)
  end
end
