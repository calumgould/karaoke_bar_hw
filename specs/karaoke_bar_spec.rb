require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestKaraokeBar < Minitest::Test

  def setup

    @song1 = Song.new("Bohemian Rapsody")
    @song2 = Song.new("Your Song")
    @song3 = Song.new("Angels")
    @song4 = Song.new("Don't Go Breaking My Heart")
    @song5 = Song.new("Baby Shark")
    @song6 = Song.new("No Diggity")

    @guest1 = Guest.new("Calum", 22, "Your Song", 200)
    @guest2 = Guest.new("Emma", 24, "Bad Guy", 100)
    @guest3 = Guest.new("Matt", 29, "Angels", 50)
    @guest4 = Guest.new("Taron", 30, "Rocketman", 150)
    @guest5 = Guest.new("Henry", 35, "Maps", 20)

    @room1 = Room.new("Room 1", @songs_available)
    @room2 = Room.new("Room 2", @songs_available)
    @room3 = Room.new("Room 3", @songs_available)

    @rooms = [@room1, @room2, @room3]
    @guests = [@guest1, @guest2, @guest3, @guest4, @guest5]
    @songs_available = [@song1, @song2, @song3, @song4, @song5, @song6]

    @karaoke_bar = KaraokeBar.new("Supercube", @rooms, @guests)

  end

  def test_karaoke_bar_name
    assert_equal("Supercube", @karaoke_bar.name)
  end

  def test_number_of_rooms
    assert_equal(3, @rooms.count)
  end

  def test_number_of_guests
    assert_equal(5, @guests.count)
  end

  def test_entry_fee
    assert_equal(10, @karaoke_bar.entry_fee)
  end

  def test_guest_enters_bar
    @karaoke_bar.guest_enters_bar(@guest1)
    assert_equal(10, @karaoke_bar.money_in_till)
    assert_equal(190, @guest1.wallet)
  end






end
