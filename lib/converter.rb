module Converter
  def translate_to_brail
    a = read_incoming_file.split('').map { |letter| english_to_brail[letter] }
  end

  def format_brail
    formatted_brail_hash = Hash.new('')
    translate_to_brail.each do |brail_array|
      brail_array = ['..', '..', '..'] if brail_array.nil?
      formatted_brail_hash[:row1] += brail_array[0]
      formatted_brail_hash[:row2] += brail_array[1]
      formatted_brail_hash[:row3] += brail_array[2]
    end
    formatted_brail_hash
  end

  def format_from_brail
    sentence = ''
    readable_lines = read_from_brail
    (readable_lines[0].length / 2).times do
      letter = []
      letter << [readable_lines[0].shift(2), readable_lines[1].shift(2), readable_lines[2].shift(2)]
      sentence += english_to_brail.select do |_character, value|
        value.join('') == letter.flatten.join('')
      end.keys[0]
    end
    sentence
  end

  def line_length_converter
    format_brail.map { |_row, value| value.scan(/.{1,80}/) }
  end
end
