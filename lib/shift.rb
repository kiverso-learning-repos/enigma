class Shift
  attr_reader :date, :key
  def initialize(key, date)
    @key = key
    @date = date
  end

  def date_squared
    date = @date
    date[0] = '' if date[0] == "0"
    date.to_i ** 2
  end

  def date_offset
    numbers = date_squared.to_s.chars.last(4)
    letters = [*"A" .. "D"]
    offset = {}
    letters.each do |letter|
      offset[letter.to_sym] = numbers[letters.index(letter)].to_i
    end
    offset
  end

  def keys_collection
    numbers = @key.chars.each_cons(2).map { |number1, number2| number1 + number2 }
    letters = [*"A" .. "D"]
    offset = {}
    letters.each do |letter|
      offset[letter.to_sym] = numbers[letters.index(letter)].to_i
    end
    offset
  end

end
