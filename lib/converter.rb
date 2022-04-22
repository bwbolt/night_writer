module Converter
  def translate_to_brail
    read_incoming_file.map { |letter| english_to_brail[letter] }
  end

  def format_brail
    formatted_brail_hash = Hash.new('')
    translate_to_brail.each do |brail_array|
      formatted_brail_hash[:row1] += brail_array[0]
      formatted_brail_hash[:row2] += brail_array[1]
      formatted_brail_hash[:row3] += brail_array[2]
    end
    formatted_brail_hash[:row1] += '\n'
    formatted_brail_hash[:row2] += '\n'
    formatted_brail_hash[:row3] += '\n'
    formatted_brail_hash
  end
end
