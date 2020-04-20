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

  def test_it_can_encrypt_with_given_key_and_current_date
    Time.stubs(:now).returns(Time.new(1995, 04, 8))
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }
  assert_equal expected, @enigma.encrypt("hello world", "02715")
  end

  def test_it_can_encrypt_with_random_key_and_current_date
    Time.stubs(:now).returns(Time.new(1995, 04, 8))
    @enigma.stubs(:generate_number).returns(2715)
    expected = {
                encryption: "keder ohulw",
                key: "02715",
                date: "040895"
                }
  assert_equal expected, @enigma.encrypt("hello world")
  end

  def test_it_can_decrypt_with_given_date_and_key
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_it_can_decrypt_with_given_key_and_current_date
    Time.stubs(:now).returns(Time.new(1995, 04, 8))
    expected = {
                decryption: "hello world",
                key: "02715",
                date: "040895"
                }
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715")
  end

  def test_it_can_get_current_date
    Time.stubs(:now).returns(Time.new(2020, 04, 15))
    assert_equal "041520", @enigma.current_date
  end

  def test_it_can_get_random_number
    number = @enigma.generate_number
    assert_instance_of Integer, number
  end

  def test_it_can_generate_keys
    @enigma.stubs(:generate_number).returns(23456)
    assert_equal "23456", @enigma.generate_key
    @enigma.stubs(:generate_number).returns(3456)
    assert_equal "03456", @enigma.generate_key
    @enigma.stubs(:generate_number).returns(6)
    assert_equal "00006", @enigma.generate_key
  end

  def test_it_can_read_from_txt_file
    filepaths = ["./text_files/test_message.txt", "./text_files/test_message_encrypted.txt"]
    @enigma.stubs(:user_input).returns(filepaths)
    expected = "Hello World!"
    assert_equal expected, @enigma.read_from_txt
    assert_equal expected, @enigma.read_from_txt("./text_files/test_message.txt")
  end

  def test_it_can_write_to_txt
    filepaths = ["./text_files/test_message.txt", "./text_files/test_message_write.txt"]
    @enigma.stubs(:user_input).returns(filepaths)
    assert_equal false, File.exists?("./text_files/test_message_write.txt")
    @enigma.write_to_txt("hello world")
    assert_equal true, File.exists?("./text_files/test_message_write.txt")
    expected = "hello world"
    assert_equal expected, @enigma.read_from_txt("./text_files/test_message_write.txt")
    File.delete("./text_files/test_message_write.txt")
  end

  def test_it_can_encrypt_from_file
    filepaths = ["./text_files/test_message.txt", "./text_files/encrypted.txt"]
    @enigma.stubs(:user_input).returns(filepaths)
    Time.stubs(:now).returns(Time.new(1995, 04, 8))
    @enigma.stubs(:generate_number).returns(2715)
    assert_equal false, File.exists?("./text_files/encrypted.txt")
    expected = "Created './text_files/encrypted.txt' with the key 02715 and date 040895"
    assert_equal expected, @enigma.encrypt_from_file
    assert_equal "keder ohulw!", @enigma.read_from_txt("./text_files/encrypted.txt")
    File.delete("./text_files/encrypted.txt")
  end



end
