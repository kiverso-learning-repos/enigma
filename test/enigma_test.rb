require "./test/test_helper"

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_it_exists
    assert_instance_of Enigma, @enigma
  end

  def test_it_has_readable_attributes
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r",
                "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @enigma.characters
  end

  def test_it_can_encrypt
    assert_equal "keder ohulw", @enigma.create_encryption("hello world", "02715", "040895")
    assert_equal "keder ohulw.", @enigma.create_encryption("Hello World.", "02715", "040895")

  end
end
