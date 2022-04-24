require 'simplecov'
SimpleCov.start
require './lib/night_object'

describe NightObject do
  it 'can perform full night writer task' do
    ARGV.replace(['english_sample.txt', 'braille_sample_correct_format.txt'])
    NightObject.night_writer
    expected_long = File.readlines('braille_sample_correct_format.txt').map { |line| line.delete("\n") }
    expected = expected_long.pop(5)
    expect(expected).to eq(['..', '..', '', '', ''])
  end

  it 'can perform full night reader task ' do
    ARGV.replace(['braille_to_english_braille.txt', 'braille_to_english_english.txt'])
    NightObject.night_reader
    expect(File.read('braille_to_english_english.txt').chomp).to eq('ab')
  end
end
