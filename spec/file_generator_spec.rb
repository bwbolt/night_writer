require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/file_generator'

describe FileGenerator do
  it 'exists with attributes' do
    night_writer = FileGenerator.new
    expect(night_writer).to be_a FileGenerator
    allow(night_writer).to receive(:incoming_file).and_return('a')
    allow(night_writer).to receive(:outgoing_file).and_return('braille.txt')
    expect(night_writer.incoming_file).to eq('a')
    expect(night_writer.outgoing_file).to eq('braille.txt')
  end

  it 'can print the creation line' do
    night_writer = FileGenerator.new
    allow(night_writer).to receive(:incoming_file_length).and_return(1)
    allow(night_writer).to receive(:outgoing_file_name).and_return('braille.txt')
    expect(night_writer.print_message).to eq("Created 'braille.txt' containing 1 characters")
  end

  it 'can write to a english_to_english.txt file' do
    night_writer = FileGenerator.new
    allow(night_writer).to receive(:translate_to_brail).and_return('a')
    allow(night_writer).to receive(:outgoing_file_name).and_return('english_to_english.txt')
    night_writer.write_to_new_brail_file
    expect(File.read('english_to_english.txt').chomp).to eq('a')
  end
end
