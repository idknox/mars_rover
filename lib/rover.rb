class Rover
  def initialize(starting_x, starting_y, starting_direction)
    @position = [starting_x, starting_y]
    @direction = starting_direction
  end

  attr_reader :position, :direction

  def change_position_to(destination)
    @position = destination if x_within_one?(destination) && y_within_one?(destination)
  end

  def change_direction_to(new_direction)
    @direction = new_direction
  end

  private

  def x_within_one?(destination)
    (destination.first - @position.first < 2 ) && (@position.first - destination.first < 2)
  end

  def y_within_one?(destination)
    (destination.last - @position.last < 2 ) && (@position.last - destination.last < 2)
  end
end