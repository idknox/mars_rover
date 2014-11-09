class Mission
  def initialize(grid_size, *rovers)
    @grid = grid_size[1].times.map { grid_size[0].times.map { 0 } }
    @rovers = rovers
    set_starting_positions
  end

  attr_reader :grid, :rovers

  private

  def set_starting_positions
    @rovers.each do |rover|
      @grid[@grid.length - 1 - rover.position[1]][rover.position[0]] = 1
    end
  end
end