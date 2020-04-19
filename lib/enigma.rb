class Enigma
attr_reader :characters

  def initialize(characters = ("a".."z").to_a << " ")
    @characters = characters
  end

  def create_encryption(message, key, date)
    shift = Shift.new(key, date).total_shifts.values
    encryption = []
    message.downcase.each_char do |character|
      if @characters.include?(character)
        encoded_characters = @characters.rotate(shift.first)
        encryption << encoded_characters[@characters.index(character)]
      else
        encryption << character
      end
      shift = shift.rotate(1)
    end
    encryption.join
  end

end
