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


end
