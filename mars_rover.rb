#!/usr/bin/env ruby
require 'CSV'
require 'pp'
require './lib/mission'

puts "Enter Rover info: "

data = CSV.readlines('./info.csv', headers: true)

bounds = [data.headers[0].to_i, data.headers[1].to_i]
rovers = []
data.each_with_index do |row, i|
  if row.first =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
    rovers << Rover.new(row[0].to_i, row[1].to_i, row[2], data[i+1].join(''))
  end
end

pp
mission = Mission.new(bounds, rovers)

mission.rovers.each do |rover|
  mission.instructions_to_rover(rover, rover.instructions)
end

pp mission.grid

