class FileGenerator
  attr_reader :incoming_file, :outgoing_file

  def initialize
    @incoming_file = ARGV[0]
    @outgoing_file = ARGV[1]
  end

  def print_message
    "Created '#{outgoing_file_name}' containing #{incoming_file_length} characters"
  end

  def read_incoming_file
    File.read(@incoming_file).chomp
  end

  def incoming_file_length
    read_incoming_file.length
  end

  def translate_to_brail
    incoming_file.map { |letter| english_to_brail[letter] }
  end

  def outgoing_file_name
    @outgoing_file
  end

  def write_to_new_brail_file
    File.write(outgoing_file_name, translate_to_brail)
  end
end
