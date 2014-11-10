require 'spec_helper'
require 'pp'

describe Mission do
  before :each do
    @rover1 = Rover.new(1, 2, 'N')
    @rover2 = Rover.new(3, 3, 'E')
    @mission = Mission.new([5, 5], [@rover1, @rover2])
  end

  it 'instantiates with a grid' do
    expected_grid = [[0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 1, 0, 0],
                     [0, 1, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can move rover N' do
    @mission.instructions_to_rover(@mission.rovers.first, 'M')
    expected_grid = [[0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 1, 0, 1, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can move rover E' do
    @mission.instructions_to_rover(@mission.rovers.first, 'RM')
    expected_grid = [[0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 1, 0, 0],
                     [0, 0, 1, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can move rover S' do
    @mission.instructions_to_rover(@mission.rovers.first, 'RRM')
    expected_grid = [[0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 1, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 1, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can move rover W' do
    @mission.instructions_to_rover(@mission.rovers.first, 'LM')
    expected_grid = [[0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 1, 0, 0],
                     [1, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can give rover multiple commands' do
    @mission.instructions_to_rover(@mission.rovers.first, 'LMLMLMLMM')
    expected_grid = [[0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 1, 0, 1, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0]]


    expect(@mission.grid).to eq(expected_grid)
    expect(@rover1.direction).to eq('N')

    @mission.instructions_to_rover(@rover2, 'MMRMMRMRRM')
    expected_grid = [[0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 1, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0, 1],
                     [0, 0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
    expect(@rover2.direction).to eq('E')
  end
end