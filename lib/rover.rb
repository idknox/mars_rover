class Rover
  def initialize(starting_x, starting_y, starting_direction)
    @position = [starting_x, starting_y]
    @direction = starting_direction
  end

  attr_reader :position, :direction

  DIRECTIONS = %w(N E S W)

  def change_position_to(destination)
    @position = destination if x_within_one?(destination) && y_within_one?(destination) && is_not_diagonal?(destination)
  end

  def change_direction_to(new_direction)
    @direction = new_direction
  end

  def x_coordinate
    @position.first
  end

  def y_coordinate
    @position.last
  end

  def turn(turn_direction)
    @direction =  turn_direction == 'L' ? DIRECTIONS[DIRECTIONS.index(@direction)-1] : (@direction == 'W' ? 'N' : DIRECTIONS[DIRECTIONS.index(@direction)+1])
  end

  private

  def x_within_one?(destination)
    (destination.first - x_coordinate < 2 ) && (x_coordinate - destination.first < 2)
  end

  def y_within_one?(destination)
    (destination.last - y_coordinate < 2 ) && (y_coordinate - destination.last < 2)
  end

  def is_not_diagonal?(destination)
    destination.first == x_coordinate || destination.last == y_coordinate
  end


end