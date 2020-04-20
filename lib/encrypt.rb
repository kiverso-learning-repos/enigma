require_relative "enigma"
require_relative "shift"
enigma = Enigma.new
puts enigma.encrypt_from_file
