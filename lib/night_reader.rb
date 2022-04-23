require './lib/file_generator'

file_generator = FileGenerator.new
p file_generator.print_message

require 'pry'
binding.pry
