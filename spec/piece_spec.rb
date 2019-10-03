require './lib/piece'
require './lib/pieces'
require './lib/coordinate'
require 'rspec'

describe 'Piece' do
  describe '#new' do
    context 'black' do
      it 'returns a piece with black set' do
        expect(Piece.new(Coordinate.new(1, 2), Piece::Set::BLACK, []).set).to eq(Piece::Set::BLACK)
      end

      it 'does not return a piece with white set' do
        expect(Piece.new(Coordinate.new(3, 2), Piece::Set::BLACK, []).set).to_not eq(Piece::Set::WHITE)
      end
    end

    context 'white' do
      it 'returns a piece with white set' do
        expect(Piece.new(Coordinate.new(1, 2), Piece::Set::WHITE, []).set).to eq(Piece::Set::WHITE)
      end

      it 'does not return a piece with black set' do
        expect(Piece.new(Coordinate.new(3, 2), Piece::Set::WHITE, []).set).to_not eq(Piece::Set::BLACK)
      end
    end
  end

  describe '#move_to' do
    before(:each) do
      @a_move = ->(current_position, proposed_position) { current_position.add(Coordinate.new(0, 1)).eql?(proposed_position) }
      @a_piece = Piece.new(Coordinate.new(3, 2), Piece::Set::WHITE, [@a_move])
    end

    it 'moves to given position if position is valid' do
      expect(@a_piece.position).to eql(Coordinate.new(3, 2))
      @a_piece.move_to(Coordinate.new(3, 3))
      expect(@a_piece.position).to eql(Coordinate.new(3, 3))
    end

    it 'does not move to given position if position is not valid' do
      expect(@a_piece.position).to eql(Coordinate.new(3, 2))
      expect { @a_piece.move_to(Coordinate.new(3, 4)) }.to raise_exception(Pieces::ValidMoves::InvalidMoveException)
    end
  end
end