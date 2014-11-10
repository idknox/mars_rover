#!/usr/bin/env ruby

puts "Enter Rover info: "

input = gets.chomp

bounds = input.split('/n').first

rover_info = input.split('/n')[1..-1]

rover_info.each