class FileGenerator
  attr_reader :incoming_file, :outgoing_file

  def initialize
    @incoming_file = ARGV[0]
    @outgoing_file = ARGV[1]
  end

  def print_message
    "Created '#{@outgoing_file}' containing #{@incoming_file.length} characters"
  end
end
