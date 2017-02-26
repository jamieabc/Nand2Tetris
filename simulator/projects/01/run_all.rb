#!/usr/bin/env ruby
`ls *.tst`.split("\n").each do |f|
  puts `HardwareSimulator.sh #{f}`
end
