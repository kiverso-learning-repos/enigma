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
end
