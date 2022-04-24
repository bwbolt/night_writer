module Converter
  def translate_to_braille
    a = read_incoming_file.split('').map { |letter| english_to_braille[letter] }
  end

  def format_braille
    formatted_braille_hash = Hash.new('')
    translate_to_braille.each do |braille_array|
      braille_array = ['..', '..', '..'] if braille_array.nil?
      formatted_braille_hash[:row1] += braille_array[0]
      formatted_braille_hash[:row2] += braille_array[1]
      formatted_braille_hash[:row3] += braille_array[2]
    end
    formatted_braille_hash
  end

  def format_from_braille
    sentence = ''
    readable_lines = read_from_braille
    until readable_lines == []
      (readable_lines[0].length / 2).times do
        letter = []
        letter << [readable_lines[0].shift(2), readable_lines[1].shift(2), readable_lines[2].shift(2)]
        sentence += english_to_braille.select do |_character, value|
          value.join('') == letter.flatten.join('')
        end.keys[0]
      end
      readable_lines.delete([])
    end
    sentence
    # require 'pry'
    # binding.pry
  end

  def line_length_converter
    format_braille.map { |_row, value| value.scan(/.{1,80}/) }
  end
end
