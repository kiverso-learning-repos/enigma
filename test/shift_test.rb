require "minitest/autorun"
require "./lib/shift"

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new("02715", "040895")
  end

  def test_it_exists
    assert_instance_of Shift, @shift
  end

  def test_it_has_readable_attributes
    assert_equal "02715", @shift.key
    assert_equal "040895", @shift.date
  end

  def test_it_can_get_date_squared
    assert_equal 1672401025, @shift.date_squared
  end

  def test_it_can_get_date_offset
    expected = {A: 1, B: 0, C: 2, D: 5}
    assert_equal expected, @shift.date_offset
  end

  def test_it_can_get_keys_collection
    expected = {A: 2, B: 27, C: 71, D: 15}
    assert_equal expected, @shift.keys_collection
  end

end
