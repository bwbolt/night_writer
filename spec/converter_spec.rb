require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/file_generator'
require './lib/converter'

describe Converter do
  it 'can convert letters to braille' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer.translate_to_braille).to eq([['o.', '..', '..']])
  end

  it 'can format braille to be printed to new file' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expected = { row1: 'o.', row2: '..', row3: '..' }
    expect(night_writer.format_braille).to eq(expected)
  end

  it 'can break lines down to be no longer than 80 characters' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer.line_length_converter).to eq([['o.'], ['..'], ['..']])
  end

  it 'can convert braille to english letters' do
    ARGV.replace(['braille_sample_for_test.txt', 'english_sample.txt'])
    night_reader = FileGenerator.new
    expect(night_reader.format_from_braille).to eq('ab')
  end
end
