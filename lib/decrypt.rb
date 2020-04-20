require_relative "enigma"
require_relative "shift"
enigma = Enigma.new
puts enigma.decrypt_from_file
