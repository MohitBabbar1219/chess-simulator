class Piece
  attr_reader :set, :position

  module Set
    BLACK = :black
    WHITE = :white
  end

  def self.black(position)
    Piece.new(position, Set::BLACK)
  end

  def self.white(position)
    Piece.new(position, Set::WHITE)
  end

  def move_to(position)
    @position = position
  end

  private

  def initialize(position, set)
    @position = position
    @set = set
  end
end