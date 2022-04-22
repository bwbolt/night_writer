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
    expected = { row1: "o.\n", row2: "..\n", row3: "..\n" }
    expect(night_writer.format_brail).to eq(expected)
  end
end
