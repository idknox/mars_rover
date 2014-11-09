require 'spec_helper'
require 'pp'

describe Mission do
  before :each do
    @rover1 = Rover.new(1, 2, 'N')
    @rover2 = Rover.new(3, 3, 'E')
    @mission = Mission.new([5, 5], @rover1, @rover2)
  end

  it 'instantiates with a grid' do
    expected_grid = [[0, 0, 0, 0, 0],
                     [0, 0, 0, 1, 0],
                     [0, 1, 0, 0, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can move rover N' do
    @mission.command_rover(@mission.rovers.first, 'M')
    expected_grid = [[0, 0, 0, 0, 0],
                     [0, 1, 0, 1, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can move rover E' do
    @mission.command_rover(@mission.rovers.first, 'R')
    @mission.command_rover(@mission.rovers.first, 'M')
    expected_grid = [[0, 0, 0, 0, 0],
                     [0, 0, 0, 1, 0],
                     [0, 0, 1, 0, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can move rover S' do
    @mission.command_rover(@mission.rovers.first, 'R')
    @mission.command_rover(@mission.rovers.first, 'R')

    @mission.command_rover(@mission.rovers.first, 'M')
    expected_grid = [[0, 0, 0, 0, 0],
                     [0, 0, 0, 1, 0],
                     [0, 0, 0, 0, 0],
                     [0, 1, 0, 0, 0],
                     [0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can move rover S' do
    @mission.command_rover(@mission.rovers.first, 'L')

    @mission.command_rover(@mission.rovers.first, 'M')
    expected_grid = [[0, 0, 0, 0, 0],
                     [0, 0, 0, 1, 0],
                     [1, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0]]

    expect(@mission.grid).to eq(expected_grid)
  end

  it 'can give rover multiple commands' do
    @mission.instructions_to_rover(@mission.rovers.first, 'LMLMLMLMM')
    expected_grid = [[0, 0, 0, 0, 0],
                     [0, 1, 0, 1, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0],
                     [0, 0, 0, 0, 0]]
    expect(@mission.grid).to eq(expected_grid)
    expect(@rover1.direction).to eq('N')
  end
end