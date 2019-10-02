require './lib/piece'
require './lib/coordinate'
require 'rspec'

describe 'Piece' do
  describe '#black' do
    it 'returns a piece with black set' do
      expect(Piece.black(Coordinate.new(1, 2)).set).to eq(Piece::Set::BLACK)
    end

    it 'does not return a piece with white set' do
      expect(Piece.black(Coordinate.new(3, 2)).set).to_not eq(Piece::Set::WHITE)
    end
  end

  describe '#black' do
    it 'returns a piece with white set' do
      expect(Piece.white(Coordinate.new(1, 2)).set).to eq(Piece::Set::WHITE)
    end

    it 'does not return a piece with black set' do
      expect(Piece.black(Coordinate.new(3, 2)).set).to_not eq(Piece::Set::BLACK)
    end
  end
end