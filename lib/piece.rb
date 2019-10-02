class Piece
  attr_reader :set, :position

  module Set
    BLACK = :black
    WHITE = :white
  end

  def self.black(position, valid_moves)
    Piece.new(position, Set::BLACK, valid_moves)
  end

  def self.white(position, valid_moves)
    Piece.new(position, Set::WHITE, valid_moves)
  end

  def move_to(position)
    @position = position
  end

  private

  def initialize(position, set, valid_moves)
    @position = position
    @set = set
    @valid_moves = valid_moves
  end
end