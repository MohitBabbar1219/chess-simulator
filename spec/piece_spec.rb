require './lib/piece'
require './lib/coordinate'
require 'rspec'

describe 'Piece' do
  describe '#black' do
    it 'returns a piece with black set' do
      expect(Piece.black(Coordinate.new(1, 2), []).set).to eq(Piece::Set::BLACK)
    end

    it 'does not return a piece with white set' do
      expect(Piece.black(Coordinate.new(3, 2), []).set).to_not eq(Piece::Set::WHITE)
    end
  end

  describe '#white' do
    it 'returns a piece with white set' do
      expect(Piece.white(Coordinate.new(1, 2), []).set).to eq(Piece::Set::WHITE)
    end

    it 'does not return a piece with black set' do
      expect(Piece.white(Coordinate.new(3, 2), []).set).to_not eq(Piece::Set::BLACK)
    end
  end

  describe '#move_to' do
    before(:each) do
      @a_move = ->(current_position, proposed_position) { current_position.add(Coordinate.new(0, 1)).eql?(proposed_position) }
      @a_piece = Piece.black(Coordinate.new(3, 2), [@a_move])
    end

    it 'moves to given position if position is valid' do
      expect(@a_piece.position).to eql(Coordinate.new(3, 2))
      @a_piece.move_to(Coordinate.new(3, 3))
      expect(@a_piece.position).to eql(Coordinate.new(3, 3))
    end

    it 'does not move to given position if position is not valid' do
      expect(@a_piece.position).to eql(Coordinate.new(3, 2))
      @a_piece.move_to(Coordinate.new(3, 4))
      expect(@a_piece.position).to eql(Coordinate.new(3, 2))
    end
  end
end