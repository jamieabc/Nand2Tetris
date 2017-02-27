#!/usr/bin/env ruby
`ls *.tst`.split("\n").each do |f|
  result = `HardwareSimulator.sh #{f}`
  puts "#{f}: #{result}"
end
