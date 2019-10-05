require 'json'

class Board
  def initialize(seed)
    @position_to_piece_map = position_to_piece_map(seed)
    @size = Coordinate.new(8, 8)
  end

  def make_move(from, to)
    piece_to_move = @position_to_piece_map[from]
    if piece_to_move.nil? || !in_board?(to)
      raise(Exceptions::InvalidMoveException)
    end
    piece_to_move.move_to(to)
    @position_to_piece_map[to] = piece_to_move
    @position_to_piece_map.delete(from)
  end

  def print_state
    game_state = []
    @position_to_piece_map.keys.map do |key|
      game_state.push(@position_to_piece_map[key].state)
    end
    puts("Copy the following json and visit https://chess-simulator.herokuapp.com/, paste it there to visualize the game state.\n")
    puts(game_state.to_json)
  end

  def is_piece_white_at?(position)
    piece = @position_to_piece_map[position]
    piece.set == Piece::Set::WHITE
  end

  private

  def in_board?(coordinate)
    origin = Coordinate.new(0, 0)
    @size.compare(coordinate) != -1 && origin.compare(coordinate) != 1
  end

  def position_to_piece_map(seed)
    position_to_piece = {}
    seed.each do |piece|
      position_to_piece[piece.position] = piece
    end
    position_to_piece
  end
end
