class Rover
  def initialize(starting_x, starting_y, starting_direction)
    @position = [starting_x, starting_y]
    @direction = starting_direction
  end

  attr_accessor :position, :direction
end