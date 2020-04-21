class Message

  def self.from_txt(filepath)
    message = File.read(filepath).split("\n")
    message = message.join(" ")
    self.new(message)
  end

attr_reader :text, :encryptable_characters
  def initialize(text, encryptable_characters = (("a".."z").to_a << " "))
    @encryptable_characters = encryptable_characters
    @text = text
  end

  def get_encoded_character(character, shift)
    if @encryptable_characters.include?(character)
      encoded_characters = @encryptable_characters.rotate(shift)
      encoded_characters[@encryptable_characters.index(character)]
    else
      character
    end
  end

  def shift_text(shifts, encryption = [])
    @text.downcase.each_char do |character|
      encryption << get_encoded_character(character, shifts.first)
      shifts = shifts.rotate(1)
    end
    encryption.join
  end
end
