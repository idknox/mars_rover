#!/usr/bin/env ruby
require 'pp'
require './lib/mission'

def create_rovers(data)
  data.each_with_index.map do |row, i|
    unless i == 0
      if row.first =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
        Rover.new(row.first.to_i, row[1].to_i, row[2], data[i+1].join(''))
      end
    end
  end
end

data = File.read('./info.txt', headers: true).split("\n").map { |line| line.split(' ') }
bounds = [data.first.first.to_i, data.first.last.to_i]

rovers = create_rovers(data)
mission = Mission.new(bounds, rovers)

mission.rovers.each do |rover|
  mission.instructions_to_rover(rover, rover.instructions)
end

pp mission.grid

