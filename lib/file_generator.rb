require './lib/converter'
require './lib/dictionary'

class FileGenerator
  include Dictionary
  include Converter
  attr_reader :incoming_file, :outgoing_file

  def initialize
    @incoming_file = ARGV[0]                       # Initializes with instance variables of file locations
    @outgoing_file = ARGV[1]
  end

  def print_message                                # Print command line reference created file
    "Created '#{@outgoing_file}' containing #{incoming_file_length} characters"
  end

  def read_incoming_file                           # Read incoming text/english based file
    File.read(@incoming_file).delete("\n")
  end

  def read_from_braille                            # Read incoming braille based file
    lines = []
    File.readlines(@incoming_file).each do |line|
      lines << line.delete!("\n")
    end
    lines_split = []
    lines.each { |line| lines_split << line.split('') }
    lines_split
  end

  def incoming_file_length                         # Give incoming file character length
    read_incoming_file.length
  end

  def write_to_new_braille_file                     # Write to a new braille file
    length = Array(0..line_length_converter[0].length)
    File.write(@outgoing_file, '')                  # Clears file of what was in it before
    length.each do |count|
      File.open(@outgoing_file, 'a') do |f|         # Places new "lines" on seperate lines, 3 high
        f.puts line_length_converter[0][count]
        f.puts line_length_converter[1][count]
        f.puts line_length_converter[2][count]
      end
    end
  end

  def write_to_new_english_file                     # Writes converted braille to english in new file
    File.write(@outgoing_file, format_from_braille)
  end
end
