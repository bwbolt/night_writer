module Converter
  def translate_to_braille                                                  # Takes incoming english letters and converts it to braille arrays
    read_incoming_file.split('').map { |letter| english_to_braille_dictionary[letter] }
  end

  def format_braille                                                        # Takes braille arrays and seperates them into correct rows
    formatted_braille_hash = Hash.new('')
    translate_to_braille.each do |braille_array|
      formatted_braille_hash[:row1] += braille_array[0]
      formatted_braille_hash[:row2] += braille_array[1]
      formatted_braille_hash[:row3] += braille_array[2]
    end
    formatted_braille_hash
  end

  def format_from_braille                                                  # Takes braille "rows" and turns them into letters and then sentences
    sentence = ''
    readable_lines = read_from_braille                                     # Takes the readable data and makes it manipulateable
    until readable_lines == []
      letter = []
      letter << [readable_lines[0].shift(2), readable_lines[1].shift(2), readable_lines[2].shift(2)]
      sentence += translate_to_english(letter)
      readable_lines.delete([])                                            # Whole block takes the first two characters from each line, compares the
    end                                                                    # resulting array to the "dictionary" and finds the english letter.
    sentence                                                               # When it has exhausted the first 3 line arrays, if there are more read,
  end                                                                      # it deletes the first 3 empty arrays and starts over.

  def line_length_converter                                               # Takes the formatted hash and breaks the values down further to limit them
    format_braille.map do |_row, value|                                   # to 1-80 character strings, utilizing 80 character strings until there are
      value.scan(/.{1,80}/)                                               # less and then using what is left.
    end
  end

  def translate_to_english(letter)                                         # Translates single braille array into a single english letter
    english_to_braille_dictionary.select do |_character, value|
      value.join('') == letter.flatten.join('')
    end.keys[0]
  end
end
