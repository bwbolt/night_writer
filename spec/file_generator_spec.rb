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
    expect(night_writer.print_message).to eq("Created '' containing 1048575 characters")
  end

  it 'can write to a brail.txt file' do
    night_writer = FileGenerator.new
    allow(night_writer).to receive(:incoming_file).and_return('a')
    allow(night_writer).to receive(:outgoing_file).and_return('english_to_english.txt')
    night_writer.translate_to_brail
    expect(File.read(@outgoing_file).chomp).to eq('a')
  end
end
