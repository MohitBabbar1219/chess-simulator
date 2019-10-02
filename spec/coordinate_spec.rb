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

  describe '#add' do
    it 'returns the result of addition of two coordinates' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(3, 4)
      coordinate_to_add = Coordinate.new(2, 2)
      expect(a_coordinate.add(coordinate_to_add)).to eql(another_coordinate)
    end

    it 'returns the result of addition of two coordinates when coordinates are negative' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(0, 1)
      coordinate_to_add = Coordinate.new(-1, -1)
      expect(a_coordinate.add(coordinate_to_add)).to eql(another_coordinate)
    end
  end
end