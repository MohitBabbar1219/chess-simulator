module Pieces
  module ValidMoves
    one_step_forward = ->(current_position, proposed_position) { current_position.add(Coordinate.new(0, 1)).eql?(proposed_position) }
    PAWN = [one_step_forward]

    vertical = ->(current_position, proposed_position) { current_position.y_coordinate == proposed_position.y_coordinate }
    horizontal = ->(current_position, proposed_position) { current_position.x_coordinate == proposed_position.x_coordinate }
    ROOK = [vertical, horizontal]

    two_half_one_up_left = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-2, 1)).eql?(proposed_position) }
    two_half_two_up_left = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-1, 2)).eql?(proposed_position) }
    two_half_one_up_right = ->(current_position, proposed_position) { current_position.add(Coordinate.new(2, 1)).eql?(proposed_position) }
    two_half_two_up_right = ->(current_position, proposed_position) { current_position.add(Coordinate.new(1, 2)).eql?(proposed_position) }
    two_half_one_down_left = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-2, -1)).eql?(proposed_position) }
    two_half_two_down_left = ->(current_position, proposed_position) { current_position.add(Coordinate.new(-1, -2)).eql?(proposed_position) }
    two_half_one_down_right = ->(current_position, proposed_position) { current_position.add(Coordinate.new(2, -1)).eql?(proposed_position) }
    two_half_two_down_right = ->(current_position, proposed_position) { current_position.add(Coordinate.new(1, -2)).eql?(proposed_position) }
    KNIGHT = [two_half_one_up_left,
              two_half_two_up_left,
              two_half_one_up_right,
              two_half_two_up_right,
              two_half_one_down_left,
              two_half_two_down_left,
              two_half_one_down_right,
              two_half_two_down_right]

    left_diagonal = ->(current_position, proposed_position) do
      result = current_position.subtract(proposed_position)
      result.x_coordinate.abs == result.y_coordinate.abs
    end
    right_diagonal = ->(current_position, proposed_position) do
      result = current_position.subtract(proposed_position)
      result.x_coordinate == result.y_coordinate
    end
    BISHOP = [left_diagonal, right_diagonal]
  end
end