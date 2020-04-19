class EncodingAlgorithm
attr_reader :characters

  def initialize(characters = ("a".."z").to_a << " ")
    @characters = characters
  end

  def create_encryption(message, key, date)
    shift = Shift.new(key, date)
    encryption = []

    message.length


  end

end
