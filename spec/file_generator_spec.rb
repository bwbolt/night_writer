require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/file_generator'

describe FileGenerator do
  it 'exists with attributes' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator).to be_a FileGenerator
    expect(file_generator.incoming_file).to eq('english_sample.txt')
    expect(file_generator.outgoing_file).to eq('braille_sample.txt')
  end

  it 'can print the creation line' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.print_message).to eq("Created 'braille_sample.txt' containing 1 characters")
  end

  it 'can produce incoming file length of a braille file' do
    ARGV.replace(['braille_sample_for_test.txt', 'english_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.incoming_file_length).to eq(12)
  end

  it 'can read incoming files' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.read_incoming_file).to eq('a')
  end

  it 'can give incoming file length of an english file' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.incoming_file_length).to eq(1)
  end

  it 'can give outgoing file name' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    file_generator = FileGenerator.new
    expect(file_generator.outgoing_file).to eq('braille_sample.txt')
  end

  it 'can write to a english_to_english.txt file' do
    ARGV.replace(['english_sample.txt', 'braille_sample.txt'])
    file_generator = FileGenerator.new
    file_generator.write_to_new_braille_file
    expect(File.read('english_to_english.txt').chomp).to eq('a')
  end

  it 'can write to a braille file in propper format' do
    ARGV.replace(['english_sample.txt', 'braille_sample_correct_format.txt'])
    file_generator = FileGenerator.new
    file_generator.write_to_new_braille_file
    expected_long = File.readlines('braille_sample_correct_format.txt').map { |line| line.delete("\n") }
    expected = expected_long.pop(5)
    expect(expected).to eq(['..', '..', '', '', ''])
  end

  it 'can read from a braille file' do
    ARGV.replace(['braille_sample_for_test.txt', 'english_sample.txt'])
    file_generator = FileGenerator.new
    expected = [['o', '.', 'o', '.'], ['.', '.', 'o', '.'], ['.', '.', '.', '.']]
    expect(file_generator.read_from_braille).to eq(expected)
  end

  it 'can write to a original message file in english' do
    ARGV.replace(['braille_to_english_braille.txt', 'braille_to_english_english.txt'])
    file_generator = FileGenerator.new
    file_generator.write_to_new_english_file
    expect(File.read('braille_to_english_english.txt').chomp).to eq('ab')
  end

  it 'has access to a dictionary' do
    file_generator = FileGenerator.new
    expected = {
      'a' => ['o.', '..', '..'],
      'b' => ['o.', 'o.', '..'],
      'c' => ['oo', '..', '..'],
      'd' => ['oo', '.o', '..'],
      'e' => ['o.', '.o', '..'],
      'f' => ['oo', 'o.', '..'],
      'g' => ['oo', 'oo', '..'],
      'h' => ['o.', 'oo', '..'],
      'i' => ['.o', 'o.', '..'],
      'j' => ['.o', 'oo', '..'],
      'k' => ['o.', '..', 'o.'],
      'l' => ['o.', 'o.', 'o.'],
      'm' => ['oo', '..', 'o.'],
      'n' => ['oo', '.o', 'o.'],
      'o' => ['o.', '.o', 'o.'],
      'p' => ['oo', 'o.', 'o.'],
      'q' => ['oo', 'oo', 'o.'],
      'r' => ['o.', 'oo', 'o.'],
      's' => ['.o', 'o.', 'o.'],
      't' => ['.o', 'oo', 'o.'],
      'u' => ['o.', '..', 'oo'],
      'v' => ['o.', 'o.', 'oo'],
      'w' => ['.o', 'oo', '.o'],
      'x' => ['oo', '..', 'oo'],
      'y' => ['oo', '.o', 'oo'],
      'z' => ['o.', '.o', 'oo'],
      ' ' => ['..', '..', '..'],
      'A' => ['..o.', '....', '.o..'],
      'B' => ['..o.', '..o.', '.o..'],
      'C' => ['..oo', '....', '.o..'],
      'D' => ['..oo', '...o', '.o..'],
      'E' => ['..o.', '...o', '.o..'],
      'F' => ['..oo', '..o.', '.o..'],
      'G' => ['..oo', '..oo', '.o..'],
      'H' => ['..o.', '..oo', '.o..'],
      'I' => ['...o', '..o.', '.o..'],
      'J' => ['...o', '..oo', '.o..'],
      'K' => ['..o.', '....', '.oo.'],
      'L' => ['..o.', '..o.', '.oo.'],
      'M' => ['..oo', '....', '.oo.'],
      'N' => ['..oo', '...o', '.oo.'],
      'O' => ['..o.', '...o', '.oo.'],
      'P' => ['..oo', '..o.', '.oo.'],
      'Q' => ['..oo', '..oo', '.oo.'],
      'R' => ['..o.', '..oo', '.oo.'],
      'S' => ['...o', '..o.', '.oo.'],
      'T' => ['...o', '..oo', '.oo.'],
      'U' => ['..o.', '....', '.ooo'],
      'V' => ['..o.', '..o.', '.ooo'],
      'W' => ['...o', '..oo', '.o.o'],
      'X' => ['..oo', '....', '.ooo'],
      'Y' => ['..oo', '...o', '.ooo'],
      'Z' => ['..o.', '...o', '.ooo'],
      'CAP' => ['..', '..', '.o'],
      ',' => ['..', 'o.', '..'],
      ';' => ['..', 'o.', 'o.'],
      ':' => ['..', 'oo', '..'],
      '.' => ['..', 'oo', '.o'],
      '!' => ['..', 'oo', 'o.'],
      '?' => ['..', 'o.', 'oo'],
      '"' => ['..', '.o', 'oo'],
      "'" => ['..', '..', 'o.'],
      '-' => ['..', '..', 'oo']

    }
    expect(file_generator.english_to_braille_dictionary).to eq(expected)
  end
end
