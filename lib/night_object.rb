require './lib/file_generator'

class NightObject < FileGenerator
  def self.night_writer
    night_object = NightObject.new
    night_object.print_message
    night_object.write_to_new_braille_file
  end

  def self.night_reader
    night_object = NightObject.new
    night_object.print_message
    night_object.write_to_new_english_file
  end
end
