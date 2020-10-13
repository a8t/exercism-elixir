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

  def simulate(robot, <<current_instruction, remaining_instructions::binary>>) do
    case current_instruction do
      current_instruction when current_instruction in @instructions ->
        robot
        |> apply_instruction(current_instruction)
        |> simulate(remaining_instructions)

      _ ->
        {:error, "invalid instruction"}
    end
  end

  defp apply_instruction(robot, ?R) do
    %{direction: current_direction, position: current_position} = robot

    new_direction =
      case current_direction do
        :north -> :east
        :east -> :south
        :south -> :west
        :west -> :north
      end

    %{
      :direction => new_direction,
      :position => current_position
    }
  end

  defp apply_instruction(robot, ?L) do
    %{direction: current_direction, position: current_position} = robot

    new_direction =
      case current_direction do
        :north -> :west
        :east -> :north
        :south -> :east
        :west -> :south
      end

    %{
      :direction => new_direction,
      :position => current_position
    }
  end

  defp apply_instruction(robot, ?A) do
    %{direction: current_direction, position: current_position} = robot

    {x_position, y_position} = current_position

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
