#!/usr/bin/env ruby
# frozen_string_literal: true

require 'jsonpath'
require 'multi_json'

begin
  jsonpath = JsonPath.new(ARGV[0])
  puts MultiJson.encode(jsonpath.on(MultiJson.decode(STDIN.read)))
rescue Exception => e
  puts(e)
  exit(false)
end
