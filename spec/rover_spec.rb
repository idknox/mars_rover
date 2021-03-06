require 'spec_helper'

describe Rover do
  before :each do
    @rover = Rover.new([1, 2], 'N')
  end

  it 'instantiates with starting position and direction' do
    expect(@rover.position).to eq([1, 2])
    expect(@rover.direction).to eq('N')
  end

  it 'can change direction' do
    @rover.change_direction_to('E')
    expect(@rover.direction).to eq('E')
  end

  it 'can change position' do
    @rover.change_position_to([1, 3])
    expect(@rover.position).to eq([1, 3])

    @rover.change_position_to([2, 3])
    expect(@rover.position).to eq([2, 3])
  end

  it 'cannot move more than one space positive on x-axis at once' do
    @rover.change_position_to([3, 2])
    expect(@rover.position).to eq([1, 2])
  end

  it 'cannot move more than one space negative on x-axis at once' do
    @rover.change_position_to([2, 2])
    expect(@rover.position).to eq([2, 2])
    @rover.change_position_to([0, 2])
    expect(@rover.position).to eq([2, 2])
  end

  it 'cannot move more than one space positive on y-axis at once' do
    @rover.change_position_to([1, 4])
    expect(@rover.position).to eq([1, 2])
  end

  it 'cannot move more than one space negative on y-axis at once' do
    @rover.change_position_to([1, 0])
    expect(@rover.position).to eq([1, 2])
  end

  it 'cannot move diagonally' do
    @rover.change_position_to([2, 3])
    expect(@rover.position).to eq([1, 2])

    @rover.change_position_to([0, 1])
    expect(@rover.position).to eq([1, 2])

    @rover.change_position_to([0, 3])
    expect(@rover.position).to eq([1, 2])

    @rover.change_position_to([2, 1])
    expect(@rover.position).to eq([1, 2])
  end

  it 'can turn' do
    @rover.turn('L')
    expect(@rover.direction).to eq('W')

    @rover.turn('L')
    expect(@rover.direction).to eq('S')

    @rover.turn('L')
    expect(@rover.direction).to eq('E')

    @rover.turn('L')
    expect(@rover.direction).to eq('N')

    @rover.turn('R')
    expect(@rover.direction).to eq('E')

    @rover.turn('R')
    expect(@rover.direction).to eq('S')

    @rover.turn('R')
    expect(@rover.direction).to eq('W')

    @rover.turn('R')
    expect(@rover.direction).to eq('N')
  end

  it 'can keep its instructions' do
    rover = Rover.new([1, 2], 'N', 'LMRMRMR')

    expect(rover.instructions).to eq('LMRMRMR')
  end
end