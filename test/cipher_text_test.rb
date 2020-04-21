require "./test/test_helper"

class CipherTextTest < Minitest::Test
  def setup
    @message1 = CipherText.new("keder ohulw")
    @message2 = CipherText.new("hello world")
  end

  def test_it_exists
    assert_instance_of CipherText, @message1
  end

  def test_it_has_readable_attributes
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r",
                "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @message1.encryptable_characters
    assert_equal "keder ohulw", @message1.text
  end

  def test_it_can_get_encoded_character
    assert_equal "k", @message1.get_encoded_character("h", 3)
    assert_equal "@", @message1.get_encoded_character("@", 33)
  end

  def test_it_can_shift_text
    assert_equal "keder ohulw", @message2.shift_text([3, 27, 73, 20])
  end

  def test_it_can_make_decryption
    expected = {
                decryption: "hello world",
                key: "",
                date: ""
                }
    assert_equal expected, @message1.decrypt([3, 27, 73, 20])
  end
end
