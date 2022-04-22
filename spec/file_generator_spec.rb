require 'rspec'
require './lib/file_generator'

describe FileGenerator do
  it 'exists with attributes' do
    night_writer = FileGenerator.new
    expect(night_writer).to be_a FileGenerator
  end
end
