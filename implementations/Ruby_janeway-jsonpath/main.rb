#!/usr/bin/env ruby

require 'janeway'
require 'json'

data = JSON.parse(STDIN.read)

begin
  results = Janeway.enum_for(ARGV[0], data).search
  puts JSON.generate(results)
rescue Janeway::Error => e
  puts(e)
  exit(2)
rescue Exception => e
  puts(e)
  exit(false)
end
