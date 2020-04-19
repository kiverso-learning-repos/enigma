class Shift
  attr_reader :date, :key
  def initialize(key, date)
    @key = key
    @date = date
  end

  def date_squared
    if date[0] == "0"
      date = @date[1..-1]
    else
      date = @date
    end
    date.to_i ** 2
  end

  def build_shift_collection(numbers)
    letters = [*"A" .. "D"]
    offset = {}
    letters.each do |letter|
      offset[letter.to_sym] = numbers[letters.index(letter)].to_i
    end
    offset
  end

  def date_offset
    date_shifts = date_squared.to_s.chars.last(4)
    build_shift_collection(date_shifts)
  end

  def keys_collection
    key_shifts = @key.chars.each_cons(2).map do |number1, number2|
      number1 + number2
    end
    build_shift_collection(key_shifts)
  end

  def total_shifts
    keys = keys_collection
    offset_shifts = date_offset
    offset_shifts.each { |shift_letter, offset| keys[shift_letter] += offset }
    keys
  end
end
