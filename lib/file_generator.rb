class FileGenerator
  attr_reader :incoming_file, :outgoing_file

  def initialize
    @incoming_file = ARGV[0]
    @outgoing_file = ARGV[1]
  end
end
