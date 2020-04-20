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

  def encrypt(message, key = generate_key, date = current_date)
    shifts = Shift.new(key, date).total_shifts.values
    encryption = {}
    encryption[:encryption] = shift_message(message, shifts)
    encryption[:key] = key
    encryption[:date] = date
    encryption
  end

  def decrypt(message, key, date = current_date)
    shifts = Shift.new(key, date).total_shifts.values
    unshifts = shifts.map{|shift_value| shift_value * -1}
    decryption = {}
    decryption[:decryption] = shift_message(message, unshifts)
    decryption[:key] = key
    decryption[:date] = date
    decryption
  end

  def current_date
    now = Time.now
    now.strftime("%m%d%y")
  end

  def generate_number
    rand(100000).to_i
  end

  def generate_key
    key_number = generate_number.to_s
    until key_number.length == 5
      key_number.prepend("0")
    end
    key_number
  end

  def user_input
    ARGV
  end

  def read_from_txt(filepath = user_input.first)
    message = File.read(filepath).split("\n")
    message.join(" ")
  end

  def write_to_txt(message)
    filepath = user_input[1]
    File.write(filepath, message)
  end

  def encrypt_from_file
    filepath = user_input[1]
    message = read_from_txt
    encryption = encrypt(message)
    encrypted_message = encryption[:encryption]
    write_to_txt(encrypted_message)
    "Created '#{filepath}' with the key #{encryption[:key]} and date #{encryption[:date]}"
  end

  def decrypt_from_file
    filepath = user_input[1]
    date = user_input[3]
    key = user_input[2]
    message = read_from_txt
    decryption = decrypt(message, key, date)
    decrypted_message = decryption[:decryption]
    write_to_txt(decrypted_message)
    "Created '#{filepath}' with the key #{decryption[:key]} and date #{decryption[:date]}"
  end
end
