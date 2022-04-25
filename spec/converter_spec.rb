require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/file_generator'
require './lib/converter'

describe Converter do
  it 'can convert letters to braille' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.translate_to_braille).to eq([['o.', '..', '..']])
  end

  it 'can format braille to be printed to new file' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    file_generator = FileGenerator.new
    expected = { row1: 'o.', row2: '..', row3: '..' }
    expect(file_generator.format_braille).to eq(expected)
  end

  it 'can break lines down to be no longer than 80 characters' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.line_length_converter).to eq([['o.'], ['..'], ['..']])
  end

  it 'can convert braille to english letters' do
    ARGV.replace(['braille_sample_for_test.txt', 'english_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.format_from_braille).to eq('ab')
  end

  it 'can translate a single brail array into an english letter ' do
    file_generator = FileGenerator.new
    expect(file_generator.translate_to_english([['o.'], ['..'], ['..']])).to eq('a')
  end

  it 'can translate with uppercase' do
    ARGV.replace(['braille_uppercase.txt', 'english_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.format_from_braille).to eq('A')
  end

  it 'can account for unrecognized values' do
    ARGV.replace(['english_nil_value.txt', 'braille_nil_value.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.translate_to_braille).to eq([['..', '..', '..']])
  end
end
