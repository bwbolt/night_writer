require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/file_generator'
require './lib/converter'

describe Converter do
  it 'can convert letters to brail' do
    night_writer = FileGenerator.new
    allow(night_writer).to receive(:read_incoming_file).and_return(['a'])
    allow(night_writer).to receive(:outgoing_file_name).and_return('english_to_brail.txt')
    expect(night_writer.translate_to_brail).to eq([['o.', '..', '..']])
  end

  it 'can format brail to be printed to new file' do
    night_writer = FileGenerator.new
    allow(night_writer).to receive(:read_incoming_file).and_return(['a'])
    allow(night_writer).to receive(:outgoing_file_name).and_return('english_to_brail.txt')
    expected = { row1: 'o.\n', row2: '..\n', row3: '..\n' }
    expect(night_writer.format_brail).to eq(expected)
  end
end
