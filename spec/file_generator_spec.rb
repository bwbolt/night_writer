require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/file_generator'

describe FileGenerator do
  it 'exists with attributes' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer).to be_a FileGenerator
    expect(night_writer.incoming_file).to eq('english_sample.txt')
    expect(night_writer.outgoing_file).to eq('braille_sample.txt')
  end

  it 'can print the creation line' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer.print_message).to eq("Created 'braille_sample.txt' containing 1 characters")
  end

  it 'can produce incoming file length of a braille file' do
    ARGV.replace(['braille_sample_for_test.txt', 'english_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer.incoming_file_length).to eq(12)
  end

  it 'can read incoming files' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer.read_incoming_file).to eq('a')
  end

  it 'can give incoming file length of an english file' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer.incoming_file_length).to eq(1)
  end

  it 'can give outgoing file name' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    expect(night_writer.outgoing_file_name).to eq('braille_sample.txt')
  end

  it 'can write to a english_to_english.txt file' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    night_writer = FileGenerator.new
    night_writer.write_to_new_brail_file
    expect(File.read('english_to_english.txt').chomp).to eq('a')
  end

  it 'can write to a braille file in propper format' do
    ARGV.replace(['english_sample.txt', 'braille_sample_correct_format.txt'])
    night_writer = FileGenerator.new
    night_writer.write_to_new_brail_file
    expected_long = File.readlines('braille_sample_correct_format.txt').map { |line| line.delete("\n") }
    expected = expected_long.pop(5)
    expect(expected).to eq(['..', '..', '', '', ''])
  end

  it 'can read from a brail file' do
    ARGV.replace(['braille_sample_for_test.txt', 'english_sample.txt'])
    night_reader = FileGenerator.new
    expected = [['o', '.', 'o', '.'], ['.', '.', 'o', '.'], ['.', '.', '.', '.']]
    expect(night_reader.read_from_brail).to eq(expected)
  end

  it 'can write to a original message file in english' do
    ARGV.replace(['braille_to_english_braille.txt', 'braille_to_english_english.txt'])
    night_reader = FileGenerator.new
    night_reader.write_to_new_english_file
    expect(File.read('braille_to_english_english.txt').chomp).to eq('ab')
  end
end
