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

  def compare(other_coordinate)
    is_outside_or_on = @x_coordinate <= other_coordinate.x_coordinate || @y_coordinate <= other_coordinate.y_coordinate
    return -1 if is_outside_or_on
    is_inside = @x_coordinate > other_coordinate.x_coordinate && @y_coordinate > other_coordinate.y_coordinate
    1 if is_inside
  end

  def hash
    @x_coordinate.hash + @y_coordinate.hash
  end
end