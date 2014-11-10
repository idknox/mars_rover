#!/usr/bin/env ruby
require 'CSV'
require 'pp'

puts "Enter Rover info: "

data = CSV.readlines('./info.csv', headers: true)

bounds = [data.headers[0], data.headers[1]]
rovers = []
data.each_with_index do |row, i|
  if row.first =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/
    rovers << Rover.new(row[0], row[1], data[i+1].join(''))
  end
end

mission = Mission.new(bounds, rovers)

mission.rovers.each do |rover|
  mission.instructions_to_rover(rover, rover.instructions)
end

rover_info.each