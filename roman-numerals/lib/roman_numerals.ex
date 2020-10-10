defmodule RomanNumerals do
  @doc """
  Convert the number to a roman number.
  """
  @spec numeral(pos_integer) :: String.t()
  def numeral(number) do
    number
    |> Integer.digits()
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.map(fn {digit, index} -> digit_to_roman_string(digit, index) end)
    |> Enum.reverse()
    |> Enum.join()
  end

  def digit_to_roman_string(digit, index) do
    %{
      1 => "I",
      2 => "II",
      3 => "III",
      4 => "IV",
      5 => "V",
      6 => "VI",
      7 => "VII",
      8 => "VIII",
      9 => "IX",
      10 => "X",
      20 => "XX",
      30 => "XXX",
      40 => "XL",
      50 => "L",
      60 => "LX",
      70 => "LXX",
      80 => "LXXX",
      90 => "XC",
      100 => "C",
      200 => "CC",
      300 => "CCC",
      400 => "CD",
      500 => "D",
      600 => "DC",
      700 => "DCC",
      800 => "DCCC",
      900 => "CM",
      1000 => "M",
      2000 => "MM",
      3000 => "MMM"
    }[Kernel.trunc(digit * :math.pow(10, index))]
  end
end
