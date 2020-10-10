defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
  end

  def decimal_to_binary(decimal_number) do
    [div(decimal_number, 2) | decimal_number |> rem(2) |> decimal_to_binary]
  end
end

"""
Given a decimal number, convert it to the appropriate sequence of events for a secret handshake.

Here's a couple of examples:

Given the input 3, the function would return the array ["wink", "double blink"] because 3 is 11 in binary.

Given the input 19, the function would return the array ["double blink", "wink"] because 19 is 10011 in binary. Notice that the addition of 16 (10000 in binary) has caused the array to be reversed.

use Bitwise (or div/rem)

If you use Bitwise, an easy way to see if a particular bit is set is to compare the binary AND (&&&) of a set of bits with the particular bit pattern you want to check, and determine if the result is the same as the pattern you're checking.

Example:

Flags: 0b11011 Check: 0b11010

Flags &&& Check: 0b11010 (All checked bits are set)

Another:

Flags: 0b11011 Check: 0b10110

Flags &&& Check: 0b10010 (Third bit not set)
"""
