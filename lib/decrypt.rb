require_relative "enigma"
require_relative "shift"
require_relative "message"
require_relative "cipher_text"
require_relative "plain_text"

enigma = Enigma.new
puts enigma.decrypt_from_file
