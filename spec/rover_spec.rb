require 'spec_helper'

describe Rover do
  it 'instantiates with starting position and direction' do
    rover = Rover.new(1, 2, 'N')
    expect(rover.position).to eq([1, 2])
    expect(rover.direction).to eq('N')
  end
end