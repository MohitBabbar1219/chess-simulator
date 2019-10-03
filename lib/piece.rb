class Piece
  attr_reader :set, :position

  def initialize(position, set, valid_moves)
    @position = position
    @set = set
    @valid_moves = valid_moves
  end

  module Set
    BLACK = :black
    WHITE = :white
  end

  def move_to(position)
    if is_move_valid(position)
      return @position = position
    end
    raise(Pieces::ValidMoves::InvalidMoveException)
  end

  private

  def is_move_valid(proposed_position)
    @valid_moves.select { |move| move.call(@position, proposed_position) }.length > 0
  end
end