require 'simplecov'
SimpleCov.start
require 'rspec'
require './lib/dictionary'

describe Dictionary do
  it 'exists' do
    dictionary = Dictionary.new
    expect(dictionary).to be_a(Dictionary)
    expected1 = {
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
      ' ' => ['..', '..', '..']

    }
    expect(dictionary.english_to_brail).to eq(expected1)
  end
end
