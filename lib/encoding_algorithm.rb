class EncodingAlgorithm
attr_reader :characters

def initialize(characters = ("a".."z").to_a << " ")
  @characters = characters
end
end
