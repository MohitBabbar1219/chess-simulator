module Pieces
  module ValidMoves
    one_step_forward = ->(current_position, proposed_position) { current_position.add(Coordinate.new(0, 1)).eql?(proposed_position) }
    PAWN = [one_step_forward]

    vertical = ->(current_position, proposed_position) { current_position.y_coordinate == proposed_position.y_coordinate }
    horizontal = ->(current_position, proposed_position) { current_position.x_coordinate == proposed_position.x_coordinate }
    ROOK = [vertical, horizontal]
  end
end