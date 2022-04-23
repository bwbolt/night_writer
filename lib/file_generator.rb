require './lib/converter'
require './lib/dictionary'

class FileGenerator < Dictionary
  include Converter
  attr_reader :incoming_file, :outgoing_file

  def initialize
    @incoming_file = ARGV[0]
    @outgoing_file = ARGV[1]
  end

  def print_message
    "Created '#{outgoing_file_name}' containing #{incoming_file_length} characters"
  end

  def read_incoming_file
    File.read(@incoming_file).delete("\n")
  end

  def incoming_file_length
    read_incoming_file.length
  end

  def outgoing_file_name
    @outgoing_file
  end

  def write_to_new_brail_file
    a = Array(0..line_length_converter[0].length)
    a.each do |count|
      File.open(@outgoing_file, 'a') do |f|
        f.puts line_length_converter[0][count]
        f.puts line_length_converter[1][count]
        f.puts line_length_converter[2][count]
      end
    end
  end
end
