require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/file_generator'

describe FileGenerator do
  it 'exists with attributes' do
    night_writer = FileGenerator.new
    expect(night_writer).to be_a FileGenerator
    allow(night_writer).to receive(:incoming_file).and_return('message.txt')
    allow(night_writer).to receive(:outgoing_file).and_return('braille.txt')
    expect(night_writer.incoming_file).to eq('message.txt')
    expect(night_writer.outgoing_file).to eq('braille.txt')
  end

  it 'can print the creation line' do
    night_writer = FileGenerator.new
    allow(night_writer).to receive(:print_message).and_return("Created 'braille.txt' containing 256 characters")
    expect(night_writer.print_message).to eq("Created 'braille.txt' containing 256 characters")
  end
end
