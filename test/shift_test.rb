require "./test/test_helper"

class ShiftTest < Minitest::Test
  def setup
    @shift = Shift.new("02715", "040895")
    @shift2 = Shift.new("12134", "121205")
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
    assert_equal 14690652025, @shift2.date_squared
  end

  def test_it_can_build_shift_collection
    expected = {A: 1, B: 0, C: 2, D: 5}
    assert_equal expected, @shift.build_shift_collection("1025")
    expected = {A: 2, B: 27, C: 71, D: 15}
    assert_equal expected, @shift.build_shift_collection(["02", "27", "71", "15"])
  end

  def test_it_can_get_date_offset
    expected = {A: 1, B: 0, C: 2, D: 5}
    assert_equal expected, @shift.date_offset
  end

  def test_it_can_get_keys_collection
    expected = {A: 2, B: 27, C: 71, D: 15}
    assert_equal expected, @shift.keys_collection
  end

  def test_it_can_get_total_shifts
    expected = {A: 3, B: 27, C: 73, D: 20}
    assert_equal expected, @shift.total_shifts
  end
end
