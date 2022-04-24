require './lib/file_generator'

file_generator = FileGenerator.new
p file_generator.print_message
file_generator.write_to_new_braille_file
