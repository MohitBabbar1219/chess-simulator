class Coordinate
  attr_reader :x_coordinate, :y_coordinate

  def initialize(x, y)
    @x_coordinate = x
    @y_coordinate = y
  end

  def eql?(other_coordinate)
    @x_coordinate == other_coordinate.x_coordinate && @y_coordinate == other_coordinate.y_coordinate
  end

  def add(other_coordinate)
    Coordinate.new(@x_coordinate + other_coordinate.x_coordinate, @y_coordinate + other_coordinate.y_coordinate)
  end

  def subtract(other_coordinate)
    Coordinate.new(@x_coordinate - other_coordinate.x_coordinate, @y_coordinate - other_coordinate.y_coordinate)
  end

  def hash
    @x_coordinate.hash + @y_coordinate.hash
  end
end