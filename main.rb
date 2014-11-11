#!/usr/bin/env ruby
require './lib/mission'

def create_rovers(data)
  rovers = []
  data.each_with_index do |row, i|
    if row.first =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/ && i != 0
      rovers << Rover.new([row[0].to_i, row[1].to_i], row[2], data[i+1].join(''))
    end
  end
  rovers
end

def print_rover_info(rover, i)
  puts ""
  puts "Rover ##{i+1} Result:"
  puts "Position: #{rover.position}"
  puts "Direction: #{rover.direction}"
  puts ""
end

data = File.read(ARGV[0]).split("\n").map { |line| line.split(' ') }
grid_bounds = [data.first.first.to_i, data.first.last.to_i]
mission = Mission.new(grid_bounds, create_rovers(data))

mission.rovers.each_with_index do |rover, i|
  mission.instructions_to_rover(rover, rover.instructions)
  print_rover_info(rover, i)
end

