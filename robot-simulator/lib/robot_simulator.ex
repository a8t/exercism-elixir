defmodule RobotSimulator do
  @directions [
    :north,
    :east,
    :south,
    :west
  ]

  @instructions [
    ?L,
    ?R,
    ?A
  ]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """

  @spec create(direction :: atom, position :: {integer, integer}) :: any

  def create(direction \\ :north, position \\ {0, 0})

  def create(direction, _position) when direction not in @directions,
    do: {:error, "invalid direction"}

  def create(_direction, position)
      when not is_tuple(position)
      when not (tuple_size(position) == 2),
      do: {:error, "invalid position"}

  def create(_direction, {positionX, positionY})
      when not is_integer(positionX) or not is_integer(positionY),
      do: {:error, "invalid position"}

  def create(direction, position) do
    %{
      :direction => direction,
      :position => position
    }
  end

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot :: any, instructions :: String.t()) :: any
  def simulate(robot, ""), do: robot

  def simulate(_robot, <<current_instruction, _remaining_instructions::binary>>)
      when current_instruction not in @instructions do
    {:error, "invalid instruction"}
  end

  def simulate(robot, <<current_instruction, remaining_instructions::binary>>) do
    robot
    |> apply_instruction(current_instruction)
    |> simulate(remaining_instructions)
  end

  defp apply_instruction(%{direction: current_direction, position: {x_position, y_position}}, ?A) do
    new_position =
      case current_direction do
        :north -> {x_position, y_position + 1}
        :east -> {x_position + 1, y_position}
        :south -> {x_position, y_position - 1}
        :west -> {x_position - 1, y_position}
      end

    %{
      :direction => current_direction,
      :position => new_position
    }
  end

  defp apply_instruction(%{direction: current_direction, position: current_position}, instruction) do
    %{
      :direction => new_direction(instruction, current_direction),
      :position => current_position
    }
  end

  defp new_direction(?R, :north), do: :east
  defp new_direction(?R, :east), do: :south
  defp new_direction(?R, :south), do: :west
  defp new_direction(?R, :west), do: :north

  defp new_direction(?L, :north), do: :west
  defp new_direction(?L, :east), do: :north
  defp new_direction(?L, :south), do: :east
  defp new_direction(?L, :west), do: :south

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot :: any) :: atom
  def direction(robot) do
    robot[:direction]
  end

  @doc """
  Return the robot's position.
  """
  @spec position(robot :: any) :: {integer, integer}
  def position(robot) do
    robot[:position]
  end
end
