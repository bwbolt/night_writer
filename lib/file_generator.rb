class FileGenerator
  attr_reader :incoming_file, :outgoing_file

  def initialize
    @incoming_file = File.read(ARGV[0]).chomp
    @outgoing_file = ARGV[1]
  end

  def print_message
    "Created '#{@outgoing_file}' containing #{@incoming_file.length} characters"
  end
end
