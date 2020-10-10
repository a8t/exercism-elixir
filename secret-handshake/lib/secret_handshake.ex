defmodule SecretHandshake do
  @actions %{
    1 => "wink",
    10 => "double blink",
    100 => "close your eyes",
    1000 => "jump"
  }

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
  def commands(code) when code > 16 do
    code |> internal_commands() |> Enum.reverse()
  end

  def commands(code) do
    code |> internal_commands()
  end

  defp internal_commands(code) do
    code
    |> Integer.digits(2)
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.map(&get_action(&1))
    |> Enum.filter(&(!Kernel.is_nil(&1)))
  end

  defp get_action({val, index}) do
    Map.get(@actions, val * Kernel.trunc(:math.pow(10, index)))
  end
end
