require './lib/coordinate'
require 'rspec'

describe 'Coordinate' do
  describe '#eql?' do
    it 'returns true for equal coordinates' do
      expect(Coordinate.new(1, 2)). to eql(Coordinate.new(1, 2))
    end

    it 'returns false for unequal coordinates' do
      expect(Coordinate.new(1, 2)). to_not eql(Coordinate.new(2, 2))
    end
  end
end