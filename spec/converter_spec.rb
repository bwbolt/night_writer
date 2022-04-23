require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/file_generator'
require './lib/converter'

describe Converter do
  it 'can convert letters to brail' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer.translate_to_brail).to eq([['o.', '..', '..']])
  end

  it 'can format brail to be printed to new file' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expected = { row1: 'o.', row2: '..', row3: '..' }
    expect(night_writer.format_brail).to eq(expected)
  end

  it 'can break lines down to be no longer than 80 characters' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer.line_length_converter).to eq([['o.'], ['..'], ['..']])
  end

  it 'can read from a braille file' do
    ARGV.replace(['braille_sample_for_test.txt', 'english_sample.txt'])
    night_reader = FileGenerator.new
    expected = [['o', '.', 'o', '.'], ['.', '.', 'o', '.'], ['.', '.', '.', '.']]
    expect(night_reader.read_from_brail).to eq(expected)
  end

  it 'can convert braille to english letters' do
    ARGV.replace(['braille_sample_for_test.txt', 'english_sample.txt'])
    night_reader = FileGenerator.new
    expect(night_reader.format_from_brail).to eq('ab')
  end
end
