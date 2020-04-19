class Enigma
attr_reader :characters

  def initialize(characters = ("a".."z").to_a << " ")
    @characters = characters
  end

  def get_encoded_character(character, shift)
    if @characters.include?(character)
      encoded_characters = @characters.rotate(shift)
      encoded_characters[@characters.index(character)]
    else
      character
    end
  end

  def shift_message(message, shifts, encryption = [])
    message.downcase.each_char do |character|
      encryption << get_encoded_character(character, shifts.first)
      shifts = shifts.rotate(1)
    end
    encryption.join
  end

  def encrypt(message, key, date)
    shifts = Shift.new(key, date).total_shifts.values
    encryption = {}
    encryption[:encryption] = shift_message(message, shifts)
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end
end
