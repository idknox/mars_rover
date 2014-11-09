class Mission
  def initialize(grid_size, *rovers)
    @grid = grid_size[1].times.map { grid_size[0].times.map { 0 } }
    @rovers = rovers
    set_starting_positions
  end

  attr_reader :grid, :rovers

  def command_rover(rover, command)
    if command == 'M'
      move_rover(rover)
    end
  end

  private

  def set_starting_positions
    @rovers.each do |rover|
      @grid[inverse_y_coordinate(rover)][x_coordinate(rover)] = 1
    end
  end

  def inverse_y_coordinate(rover)
    @grid.length - 1 - rover.position[1]
  end

  def x_coordinate(rover)
    rover.position[0]
  end

  def move_rover(rover)
    rover.change_position_
  end

  def rover_can_move?(rover, command)

  end
end