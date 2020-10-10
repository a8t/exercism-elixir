defmodule GuessingGame do
  # guess between a low number and a high number -> guess a middle number
  # tell the user our guess
  # if it's yes -> game over
  # "bigger" -> bigger(low, high)
  # "smaller" -> smaller(low, high)
  # anything else -> tell user to enter a valid response

  def guess(low, high) do
     mid(low, high)
  end

  def mid(low, high) do
    div(low + high,   2)
  endf

  def bigger(low, high) do
    new_low = min(mid(low, high) + 1, high)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low,      high - 1))
    guess(new_high, high)
  end
end
