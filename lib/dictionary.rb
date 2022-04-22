class Dictionary
  attr_reader :english_to_brail

  def initialize
    @english_to_brail = english_to_brail
  end

  def english_to_brail
    {
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
      'z' => ['o.', '.o', 'oo']

    }
  end
end
