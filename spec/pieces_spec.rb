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

    describe '::KNIGHT' do
      it 'allows knight to move one step forward and two steps left' do
        a_position = Coordinate.new(5, 3)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(3, 4)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move one step forward and two steps right' do
        a_position = Coordinate.new(5, 3)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(7, 4)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move two steps forward and one step left' do
        a_position = Coordinate.new(5, 3)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(4, 5)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move two steps forward and one step right' do
        a_position = Coordinate.new(5, 3)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(6, 5)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move one step backward and two steps left' do
        a_position = Coordinate.new(5, 3)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(3, 2)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move one step backward and two steps right' do
        a_position = Coordinate.new(5, 3)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(7, 2)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move two steps backward and one step left' do
        a_position = Coordinate.new(5, 3)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(4, 1)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move two steps backward and one step right' do
        a_position = Coordinate.new(5, 3)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(6, 1)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'does not allow knight to move diagonally' do
        a_position = Coordinate.new(1, 2)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(2, 3)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(a_position)
      end

      it 'does not allow knight to move vertically' do
        a_position = Coordinate.new(1, 2)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(1, 4)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(a_position)
      end

      it 'does not allow knight to move horizontally' do
        a_position = Coordinate.new(1, 2)
        a_knight = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::KNIGHT)
        position_to_move_to = Coordinate.new(5, 2)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(a_position)
      end
    end

    describe '::BISHOP' do
      it 'allows bishop to move on right diagonal upwards' do
        a_position = Coordinate.new(5, 3)
        a_bishop = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::BISHOP)
        position_to_move_to = Coordinate.new(7, 5)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(position_to_move_to)
      end

      it 'allows bishop to move on right diagonal downwards' do
        a_position = Coordinate.new(5, 3)
        a_bishop = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::BISHOP)
        position_to_move_to = Coordinate.new(2, 0)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(position_to_move_to)
      end

      it 'allows bishop to move on left diagonal upwards' do
        a_position = Coordinate.new(5, 3)
        a_bishop = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::BISHOP)
        position_to_move_to = Coordinate.new(2, 6)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(position_to_move_to)
      end

      it 'allows bishop to move on left diagonal downwards' do
        a_position = Coordinate.new(5, 3)
        a_bishop = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::BISHOP)
        position_to_move_to = Coordinate.new(7, 1)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(position_to_move_to)
      end

      it 'does not allow bishop to move three steps right' do
        a_position = Coordinate.new(1, 2)
        a_bishop = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::BISHOP)
        position_to_move_to = Coordinate.new(4, 2)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(a_position)
      end

      it 'does not allow bishop to move two steps forward' do
        a_position = Coordinate.new(1, 2)
        a_bishop = Piece.new(a_position, Piece::Set::WHITE, Pieces::ValidMoves::BISHOP)
        position_to_move_to = Coordinate.new(3, 2)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(a_position)
      end
    end
  end
end