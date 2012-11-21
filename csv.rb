#!/usr/bin/env ruby
# encoding: UTF-8

require 'yaml'
require 'csv'

i = 0

CSV.open('/dev/stdout', "wb", :col_sep => ';') do |csv|
  Dir.glob("data/*.yaml").each do |file|
    yaml = YAML.load_file(file)
    csv << yaml.keys if i+=1
    csv << yaml.values
  end
end

