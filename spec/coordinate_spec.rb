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

    it 'returns the result of addition of two coordinates when coordinates to be added are negative' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(0, 1)
      coordinate_to_add = Coordinate.new(-1, -1)
      expect(a_coordinate.add(coordinate_to_add)).to eql(another_coordinate)
    end
  end

  describe '#subtract' do
    it 'returns the result of subtraction of coordinate to be reduced from a coordinate' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(-1, 0)
      coordinate_to_subtract = Coordinate.new(2, 2)
      expect(a_coordinate.subtract(coordinate_to_subtract)).to eql(another_coordinate)
    end

    it 'returns the result of addition of two coordinates when coordinates are negative' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(2, 3)
      coordinate_to_subtract = Coordinate.new(-1, -1)
      expect(a_coordinate.subtract(coordinate_to_subtract)).to eql(another_coordinate)
    end
  end

  describe '#compare' do
    it 'returns -1 if the x coordinate of the point lies outside the area enclosed by the coordinate' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(10, 0)
      expect(a_coordinate.compare(another_coordinate)).to eql(-1)
    end

    it 'returns -1 if the y coordinate of the point lies outside the area enclosed by the coordinate' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(0, 10)
      expect(a_coordinate.compare(another_coordinate)).to eql(-1)
    end

    it 'returns -1 if both x and y coordinates of the point lie outside the area enclosed by the coordinate' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(10, 10)
      expect(a_coordinate.compare(another_coordinate)).to eql(-1)
    end

    it 'returns -1 if the point lies on the point being compared' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(1, 2)
      expect(a_coordinate.compare(another_coordinate)).to eql(-1)
    end

    it 'returns 1 if both x and y coordinates of the point lie inside the area enclosed by the coordinate' do
      a_coordinate = Coordinate.new(1, 2)
      another_coordinate = Coordinate.new(0, 1)
      expect(a_coordinate.compare(another_coordinate)).to eql(1)
    end
  end
end