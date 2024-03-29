require './lib/piece'
require './lib/coordinate'
require './lib/pieces'
require './lib/exceptions'

describe 'Pieces' do
  describe '::ValidMoves' do
    describe '::PAWN' do
      it 'allows black pawn to move one step forward' do
        a_position = Coordinate.new(1, 2)
        a_pawn = Pieces.create_pawn(a_position, Piece::Set::BLACK)
        position_to_move_to = Coordinate.new(1, 3)
        a_pawn.move_to(position_to_move_to)
        expect(a_pawn.position).to eql(position_to_move_to)
      end

      it 'allows white pawn to move one step backward' do
        a_position = Coordinate.new(1, 2)
        a_pawn = Pieces.create_pawn(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 1)
        a_pawn.move_to(position_to_move_to)
        expect(a_pawn.position).to eql(position_to_move_to)
      end

      it 'does not allow white pawn to move one step forward' do
        a_position = Coordinate.new(1, 2)
        a_pawn = Pieces.create_pawn(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 3)
        expect { a_pawn.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end

      it 'does not allow black pawn to move one step backward' do
        a_position = Coordinate.new(1, 2)
        a_pawn = Pieces.create_pawn(a_position, Piece::Set::BLACK)
        position_to_move_to = Coordinate.new(1, 1)
        expect { a_pawn.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end

      it 'does not allow pawn to move diagonal' do
        a_position = Coordinate.new(1, 2)
        a_pawn = Pieces.create_pawn(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(2, 3)
        expect { a_pawn.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end
    end

    describe '::ROOK' do
      it 'allows rook to move one step forward' do
        a_position = Coordinate.new(1, 2)
        a_rook = Pieces.create_rook(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 3)
        a_rook.move_to(position_to_move_to)
        expect(a_rook.position).to eql(position_to_move_to)
      end

      it 'allows rook to move two steps backward' do
        a_position = Coordinate.new(1, 2)
        a_rook = Pieces.create_rook(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 0)
        a_rook.move_to(position_to_move_to)
        expect(a_rook.position).to eql(position_to_move_to)
      end

      it 'allows rook to move three steps right' do
        a_position = Coordinate.new(1, 2)
        a_rook = Pieces.create_rook(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(4, 2)
        a_rook.move_to(position_to_move_to)
        expect(a_rook.position).to eql(position_to_move_to)
      end

      it 'does not allow rook to move diagonal' do
        a_position = Coordinate.new(1, 2)
        a_rook = Pieces.create_rook(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(2, 3)
        expect { a_rook.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end
    end

    describe '::KNIGHT' do
      it 'allows knight to move one step forward and two steps left' do
        a_position = Coordinate.new(5, 3)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(3, 4)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move one step forward and two steps right' do
        a_position = Coordinate.new(5, 3)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(7, 4)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move two steps forward and one step left' do
        a_position = Coordinate.new(5, 3)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(4, 5)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move two steps forward and one step right' do
        a_position = Coordinate.new(5, 3)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(6, 5)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move one step backward and two steps left' do
        a_position = Coordinate.new(5, 3)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(3, 2)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move one step backward and two steps right' do
        a_position = Coordinate.new(5, 3)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(7, 2)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move two steps backward and one step left' do
        a_position = Coordinate.new(5, 3)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(4, 1)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'allows knight to move two steps backward and one step right' do
        a_position = Coordinate.new(5, 3)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(6, 1)
        a_knight.move_to(position_to_move_to)
        expect(a_knight.position).to eql(position_to_move_to)
      end

      it 'does not allow knight to move diagonally' do
        a_position = Coordinate.new(1, 2)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(2, 3)
        expect { a_knight.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end

      it 'does not allow knight to move vertically' do
        a_position = Coordinate.new(1, 2)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 4)
        expect { a_knight.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end

      it 'does not allow knight to move horizontally' do
        a_position = Coordinate.new(1, 2)
        a_knight = Pieces.create_knight(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(5, 2)
        expect { a_knight.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end
    end

    describe '::BISHOP' do
      it 'allows bishop to move on right diagonal upwards' do
        a_position = Coordinate.new(5, 3)
        a_bishop = Pieces.create_bishop(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(7, 5)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(position_to_move_to)
      end

      it 'allows bishop to move on right diagonal downwards' do
        a_position = Coordinate.new(5, 3)
        a_bishop = Pieces.create_bishop(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(2, 0)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(position_to_move_to)
      end

      it 'allows bishop to move on left diagonal upwards' do
        a_position = Coordinate.new(5, 3)
        a_bishop = Pieces.create_bishop(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(2, 6)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(position_to_move_to)
      end

      it 'allows bishop to move on left diagonal downwards' do
        a_position = Coordinate.new(5, 3)
        a_bishop = Pieces.create_bishop(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(7, 1)
        a_bishop.move_to(position_to_move_to)
        expect(a_bishop.position).to eql(position_to_move_to)
      end

      it 'does not allow bishop to move three steps right' do
        a_position = Coordinate.new(1, 2)
        a_bishop = Pieces.create_bishop(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(4, 2)
        expect { a_bishop.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end

      it 'does not allow bishop to move two steps forward' do
        a_position = Coordinate.new(1, 2)
        a_bishop = Pieces.create_bishop(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(3, 2)
        expect { a_bishop.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end
    end

    describe '::KING' do
      it 'allows king to move one step forward' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 3)
        a_king.move_to(position_to_move_to)
        expect(a_king.position).to eql(position_to_move_to)
      end

      it 'allows king to move one step backward' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 1)
        a_king.move_to(position_to_move_to)
        expect(a_king.position).to eql(position_to_move_to)
      end

      it 'allows king to move one step left' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(0, 2)
        a_king.move_to(position_to_move_to)
        expect(a_king.position).to eql(position_to_move_to)
      end

      it 'allows king to move one step right' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(2, 2)
        a_king.move_to(position_to_move_to)
        expect(a_king.position).to eql(position_to_move_to)
      end

      it 'allows king to move one step right diagonal upward' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(2, 3)
        a_king.move_to(position_to_move_to)
        expect(a_king.position).to eql(position_to_move_to)
      end

      it 'allows king to move one step right diagonal downward' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(0, 1)
        a_king.move_to(position_to_move_to)
        expect(a_king.position).to eql(position_to_move_to)
      end

      it 'allows king to move one step left diagonal upward' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(0, 3)
        a_king.move_to(position_to_move_to)
        expect(a_king.position).to eql(position_to_move_to)
      end

      it 'allows king to move one step left diagonal downward' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(2, 1)
        a_king.move_to(position_to_move_to)
        expect(a_king.position).to eql(position_to_move_to)
      end

      it 'does not allow king to move two step right diagonal upward' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(3, 4)
        expect { a_king.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end

      it 'does not allow king to move two steps right' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(3, 2)
        expect { a_king.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end

      it 'does not allow king to move two steps forward' do
        a_position = Coordinate.new(1, 2)
        a_king = Pieces.create_king(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 4)
        expect { a_king.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end
    end

    describe '::QUEEN' do
      it 'allows queen to move two steps forward' do
        a_position = Coordinate.new(1, 2)
        a_queen = Pieces.create_queen(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 4)
        a_queen.move_to(position_to_move_to)
        expect(a_queen.position).to eql(position_to_move_to)
      end

      it 'allows queen to move two steps backward' do
        a_position = Coordinate.new(1, 2)
        a_queen = Pieces.create_queen(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 0)
        a_queen.move_to(position_to_move_to)
        expect(a_queen.position).to eql(position_to_move_to)
      end

      it 'allows queen to move three steps right' do
        a_position = Coordinate.new(1, 2)
        a_queen = Pieces.create_queen(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(4, 2)
        a_queen.move_to(position_to_move_to)
        expect(a_queen.position).to eql(position_to_move_to)
      end

      it 'allows queen to move two steps on right diagonal upward' do
        a_position = Coordinate.new(1, 2)
        a_queen = Pieces.create_queen(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(3, 4)
        a_queen.move_to(position_to_move_to)
        expect(a_queen.position).to eql(position_to_move_to)
      end

      it 'does not allow queen to move like a knight' do
        a_position = Coordinate.new(5, 3)
        a_queen = Pieces.create_queen(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(3, 4)
        expect { a_queen.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end

      it 'does not allow queen to move to ad-hoc invalid places' do
        a_position = Coordinate.new(5, 3)
        a_queen = Pieces.create_queen(a_position, Piece::Set::WHITE)
        position_to_move_to = Coordinate.new(1, 4)
        expect { a_queen.move_to(position_to_move_to) }.to raise_exception(Exceptions::InvalidMoveException)
      end
    end
  end
end