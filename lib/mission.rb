class Mission
  def initialize(upper_bound, *rovers)
    @grid = (upper_bound.last+1).times.map { (upper_bound.first+1).times.map { 0 } }
    @rovers = rovers
    set_starting_positions
  end

  attr_reader :grid, :rovers

  def command_rover(rover, command)
    if command == 'M'
      rover.move
    else
      rover.turn(command)
    end
  end

  def instructions_to_rover(rover, instructions)
    old_position = rover.position
    instructions.chars.each {|command| command_rover(rover, command)}
    @grid[@grid.length - old_position.last - 1][old_position.first] = 0
    @grid[@grid.length - rover.position.last - 1][rover.x_coord] = 1
  end

  private

  def set_starting_positions
    @rovers.each do |rover|
      @grid[inverse_y_coordinate(rover)][rover.x_coord] = 1
    end
  end

  def inverse_y_coordinate(rover)
    @grid.length - rover.y_coord - 1
  end

  def rover_can_move?(rover, command)

  end
end