require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestGuests < Minitest::Test

  def setup
  @guest1 = Guest.new("Calum", 22, "Your Song", 200)
  @guest2 = Guest.new("Emma", 24, "Bad Guy", 100)
  @guest3 = Guest.new("Matt", 29, "Angels", 50)
  @guest4 = Guest.new("Taron", 30, "Rocketman", 150)
  @guest5 = Guest.new("Henry", 35, "Maps", 20)

  @guests = [@guest1, @guest2, @guest3, @guest4, @guest5]
  end

  def test_money_in_wallet
    assert_equal(200, @guest1.wallet)
  end

  def test_favourite_song
    assert_equal("Rocketman", @guest4.favourite_song)
  end

  def test_remove_money_from_guest
    @guest1.remove_money_from_guest(10)
    assert_equal(190, @guest1.wallet)
  end





end
