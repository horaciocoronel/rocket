require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  # Write your tests here!
  def setup
    @rocket = Rocket.new
  end

  def test_change_name
    result = @rocket.name=('Aloha')
    expected = 'Aloha'
    assert_equal(expected, result)
  end

  def test_change_colour
    result = @rocket.colour=('Red')
    expected = 'Red'
    assert_equal(expected, result)
  end

  def test_flying_false
    result = @rocket.flying?
    expected = false
    assert_equal(expected, result)
  end

  def test_flying_true
    @rocket = Rocket.new(:flying => true)
    result = @rocket.flying?
    expected = true
    assert_equal(expected, result)
  end

  def test_lift_off_when_rocket_in_the_air
    @rocket = Rocket.new(:flying => true)
    result = @rocket.lift_off
    expected = false
    assert_equal(expected, result)
  end

  def test_lift_off_when_rocket_on_the_ground
    @rocket = Rocket.new(:flying => false)
    result = @rocket.lift_off
    expected = true
    assert_equal(@rocket.flying?, true)
    assert_equal(expected, result)
  end

  def test_tell_rocket_to_land
    @rocket = Rocket.new(:flying => true)
    result = @rocket.land
    expected = true
    assert_equal(@rocket.flying?, false)
    assert_equal(expected, result)
  end

  def test_tell_rocket_to_land_but_its_on_the_ground
    @rocket = Rocket.new(:flying => false)
    result = @rocket.land
    expected = false
    assert_equal(expected, result)
  end

  def test_rocket_is_flying
    @rocket = Rocket.new(:flying => true)
    @rocket.name = 'New Name'
    result = @rocket.status
    expected = "Rocket #{@rocket.name} is flying through the sky!"
    assert_equal(expected, result)
  end

  def test_rocket_is_not_flying
    @rocket = Rocket.new(:flying => false)
    @rocket.name = 'New Name'
    result = @rocket.status
    expected = "Rocket #{@rocket.name} is ready for lift off!"
    assert_equal(expected, result)
  end

end
