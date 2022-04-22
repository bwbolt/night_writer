module Converter
  def translate_to_brail
    read_incoming_file.map { |letter| english_to_brail[letter] }
  end
end
