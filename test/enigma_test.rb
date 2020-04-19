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

  def test_it_can_get_encoded_character
    assert_equal "k", @enigma.get_encoded_character("h", 3)
    assert_equal "@", @enigma.get_encoded_character("@", 33)
  end

  def test_it_can_shift_message
    assert_equal "keder ohulw", @enigma.shift_message("hello world", [3, 27, 73, 20])
    assert_equal "keder ohulw.", @enigma.shift_message("Hello World.", [3, 27, 73, 20])
  end

  def test_it_can_encrypt_with_given_date_and_key
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }
  assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  # def test_it_can_encrypt_with_given_date_and_key
  #   expected = {
  #               encryption: "keder ohulw",
  #               key: "02715",
  #               date: "040895"
  #               }
  # assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  # end

  def test_it_can_decrypt_with_given_date_and_key
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_get_current_date
    Time.stubs(:now).returns(Time.new(2020, 04, 15))
    assert_equal "041520", @enigma.current_date
  end

end
