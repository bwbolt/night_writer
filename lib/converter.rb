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
    formatted_brail_hash[:row1] += "\n"
    formatted_brail_hash[:row2] += "\n"
    formatted_brail_hash[:row3] += "\n"
    a = formatted_brail_hash
    require 'pry'
    binding.pry
  end
end
