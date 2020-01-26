require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRooms < Minitest::Test

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

    @songs_available = [@song1, @song2, @song3, @song4, @song5, @song6]
    @rooms = [@room1, @room2, @room3]
    @guests = [@guest1, @guest2, @guest3, @guest4, @guest5]

    @room1 = Room.new("Room 1", @songs_available, 0)
    @room2 = Room.new("Room 2", @songs_available, 0)
    @room3 = Room.new("Room 3", @songs_available, 0)

  end

  def test_number_of_rooms
    assert_equal(3, @rooms.count)
  end

  def test_number_of_songs_available
    assert_equal(6, @room1.song_count)
  end

  def test_number_of_guests_in_room
    current_capacity = @room1.check_number_of_guests_in_room
    assert_equal(0, current_capacity)
  end

  def test_song_is_present
    assert_equal("Baby Shark", @song5.name)
  end

  def test_add_new_song_to_room
    @room1.add_new_song_to_room("Someone Like You")
    assert_equal(7, @room1.song_count)
  end

  def test_add_guest_to_room
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    current_capacity = @room1.check_number_of_guests_in_room
    assert_equal(3, current_capacity)
  end

  def test_add_guest_to_room__exceed_max_capacity
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    @room1.add_guest_to_room(@guest4)
    current_capacity = @room1.check_number_of_guests_in_room
    assert_equal(3, current_capacity)
  end

  def test_favourite_song_on_list__is_on
    result = @room1.favourite_song_is_on_list(@guest1)
    assert_equal("Whooo!!", result)
  end

  def test_favourite_song_on_list__is_not_on
    result = @room1.favourite_song_is_on_list(@guest4)
    assert_equal("Awwww", result)
  end

  def test_check_room_tab
    assert_equal(0, @room1.room_tab)
  end

  def test_add_to_room_tab
    @room1.add_money_to_room_tab(10)
    assert_equal(10, @room1.room_tab)
  end

  def test_total_customer_room_cash
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    assert_equal(350, @room1.total_customer_room_cash)
  end


end
