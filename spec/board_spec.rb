require './lib/piece'
require './lib/coordinate'
require './lib/board'
require './lib/exceptions'
require './lib/pieces'

describe 'Board' do
  describe '#make_move' do
    it 'moves the piece from one coordinate to another it the move is valid' do
      from_coordinate = Coordinate.new(1, 2)
      to_coordinate = Coordinate.new(3, 4)
      a_piece = Pieces.create_queen(from_coordinate, Piece::Set::BLACK)
      a_board = Board.new([a_piece])
      a_board.make_move(from_coordinate, to_coordinate)
      expect(a_piece.position).to eql(to_coordinate)
    end

    it 'raises error if the move is invalid' do
      from_coordinate = Coordinate.new(1, 2)
      to_coordinate = Coordinate.new(3, 5)
      a_piece = Pieces.create_queen(from_coordinate, Piece::Set::BLACK)
      a_board = Board.new([a_piece])
      expect { a_board.make_move(from_coordinate, to_coordinate) }.to raise_exception(Exceptions::InvalidMoveException)
    end

    it 'raises error if the to position is outside the board' do
      from_coordinate = Coordinate.new(1, 2)
      to_coordinate = Coordinate.new(8, 5)
      a_piece = Pieces.create_queen(from_coordinate, Piece::Set::BLACK)
      a_board = Board.new([a_piece])
      expect { a_board.make_move(from_coordinate, to_coordinate) }.to raise_exception(Exceptions::InvalidMoveException)
    end

    it 'raises error if the to position has negative coordinates' do
      from_coordinate = Coordinate.new(1, 2)
      to_coordinate = Coordinate.new(-5, 5)
      a_piece = Pieces.create_queen(from_coordinate, Piece::Set::BLACK)
      a_board = Board.new([a_piece])
      expect { a_board.make_move(from_coordinate, to_coordinate) }.to raise_exception(Exceptions::InvalidMoveException)
    end

    it 'raises error if there is no piece at the from position' do
      from_coordinate = Coordinate.new(1, 2)
      wrong_coordinate = Coordinate.new(1, 5)
      a_piece = Pieces.create_queen(from_coordinate, Piece::Set::BLACK)
      a_board = Board.new([a_piece])
      expect { a_board.make_move(wrong_coordinate, from_coordinate) }.to raise_exception(Exceptions::InvalidMoveException)
    end

    it 'deletes old position of the piece from the board' do
      from_coordinate = Coordinate.new(1, 2)
      to_coordinate = Coordinate.new(3, 4)
      a_piece = Pieces.create_queen(from_coordinate, Piece::Set::BLACK)
      a_board = Board.new([a_piece])
      a_board.make_move(from_coordinate, to_coordinate)
      expect { a_board.make_move(from_coordinate, to_coordinate) }.to raise_exception(Exceptions::InvalidMoveException)
    end
  end

  describe '#is_piece_white_at?' do
    it 'returns true given the piece at concerned position is white' do
      a_position = Coordinate.new(1, 2)
      a_piece = Pieces.create_queen(a_position, Piece::Set::WHITE)
      a_board = Board.new([a_piece])
      expect(a_board.is_piece_white_at?(a_position)).to be_truthy
    end

    it 'returns false given the piece at concerned position is black' do
      a_position = Coordinate.new(1, 2)
      a_piece = Pieces.create_queen(a_position, Piece::Set::BLACK)
      a_board = Board.new([a_piece])
      expect(a_board.is_piece_white_at?(a_position)).to be_falsey
    end
  end
end