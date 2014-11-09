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

  def x_coord
    @position.first
  end

  def y_coord
    @position.last
  end

  def turn(turn_direction)
    @direction =  turn_direction == 'L' ? DIRECTIONS[DIRECTIONS.index(@direction)-1] : (@direction == 'W' ? 'N' : DIRECTIONS[DIRECTIONS.index(@direction)+1])
  end

  def move
    change_position_to([x_coord, y_coord - 1]) if @direction == 'N'
    change_position_to([x_coord, y_coord + 1]) if @direction == 'S'
    change_position_to([x_coord + 1, y_coord]) if @direction == 'E'
    change_position_to([x_coord - 1, y_coord]) if @direction == 'W'
  end

  private

  def x_within_one?(destination)
    (destination.first - x_coord < 2 ) && (x_coord - destination.first < 2)
  end

  def y_within_one?(destination)
    (destination.last - y_coord < 2 ) && (y_coord - destination.last < 2)
  end

  def is_not_diagonal?(destination)
    destination.first == x_coord || destination.last == y_coord
  end
end