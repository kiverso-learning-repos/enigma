require "./test/test_helper"

class EncodingAlgorithmTest < Minitest::Test
  def setup
    @encoding_algorithm = EncodingAlgorithm.new
  end

  def test_it_exists
    assert_instance_of EncodingAlgorithm, @encoding_algorithm
  end

  def test_it_has_readable_attributes
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                "j", "k", "l", "m", "n", "o", "p", "q", "r",
                "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, @encoding_algorithm.characters
  end

  def test_it_can_encrypt
    assert_equal "keder ohulw", @encoding_algorithm.create_encryption("hello world", "02715", "040895")
    
  end
end
