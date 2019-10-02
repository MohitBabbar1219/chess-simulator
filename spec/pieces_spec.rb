require './lib/piece'
require './lib/coordinate'
require './lib/pieces'

describe 'Pieces' do
  describe '::ValidMoves' do
    describe '::PAWN' do
      it 'allows pawn to move one step forward' do
        a_position = Coordinate.new(1, 2)
        a_pawn = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::PAWN)
        position_to_move_to = Coordinate.new(1, 3)
        a_pawn.move_to(position_to_move_to)
        expect(a_pawn.position).to eql(position_to_move_to)
      end

      it 'does not allow pawn to move one step backward' do
        a_position = Coordinate.new(1, 2)
        a_pawn = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::PAWN)
        position_to_move_to = Coordinate.new(1, 1)
        a_pawn.move_to(position_to_move_to)
        expect(a_pawn.position).to eql(a_position)
      end

      it 'does not allow pawn to move diagonal' do
        a_position = Coordinate.new(1, 2)
        a_pawn = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::PAWN)
        position_to_move_to = Coordinate.new(2, 3)
        a_pawn.move_to(position_to_move_to)
        expect(a_pawn.position).to eql(a_position)
      end
    end

    describe '::ROOK' do
      it 'allows rook to move one step forward' do
        a_position = Coordinate.new(1, 2)
        a_rook = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::ROOK)
        position_to_move_to = Coordinate.new(1, 3)
        a_rook.move_to(position_to_move_to)
        expect(a_rook.position).to eql(position_to_move_to)
      end

      it 'allows rook to move two steps backward' do
        a_position = Coordinate.new(1, 2)
        a_rook = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::ROOK)
        position_to_move_to = Coordinate.new(1, 0)
        a_rook.move_to(position_to_move_to)
        expect(a_rook.position).to eql(position_to_move_to)
      end

      it 'allows rook to move three steps right' do
        a_position = Coordinate.new(1, 2)
        a_rook = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::ROOK)
        position_to_move_to = Coordinate.new(4, 2)
        a_rook.move_to(position_to_move_to)
        expect(a_rook.position).to eql(position_to_move_to)
      end

      it 'does not allow rook to move diagonal' do
        a_position = Coordinate.new(1, 2)
        a_rook = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::ROOK)
        position_to_move_to = Coordinate.new(2, 3)
        a_rook.move_to(position_to_move_to)
        expect(a_rook.position).to eql(a_position)
      end
    end
  end
end