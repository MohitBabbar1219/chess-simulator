module Pieces
  module ValidMoves
    one_step_forward = ->(current_position, proposed_position) { current_position.add(Coordinate.new(0, 1)).eql?(proposed_position) }
    PAWN = [one_step_forward]
  end
end