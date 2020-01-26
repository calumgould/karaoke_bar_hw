require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../karaoke_bar')
require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../drink')

class TestKaraokeBar < Minitest::Test

  def setup

    # @song1 = Song.new("Bohemian Rapsody")
    # @song2 = Song.new("Your Song")
    # @song3 = Song.new("Angels")
    # @song4 = Song.new("Don't Go Breaking My Heart")
    # @song5 = Song.new("Baby Shark")
    # @song6 = Song.new("No Diggity")

    @guest1 = Guest.new("Calum", 22, "Your Song", 200)
    @guest2 = Guest.new("Emma", 24, "Bad Guy", 100)
    @guest3 = Guest.new("Matt", 29, "Angels", 50)
    @guest4 = Guest.new("Taron", 30, "Rocketman", 150)
    @guest5 = Guest.new("Henry", 35, "Maps", 20)

    @room1 = Room.new("Room 1", @songs_available, 0)
    @room2 = Room.new("Room 2", @songs_available, 0)
    @room3 = Room.new("Room 3", @songs_available, 0)

    @drink1 = Drink.new("Gin & Tonic", 10)
    @drink2 = Drink.new("Beer", 5)
    @drink3 = Drink.new("Wine", 20)
    @drink4 = Drink.new("Champagne", 50)

    @drinks_available = [@drink1, @drink2, @drink3, @drink4]
    @rooms = [@room1, @room2, @room3]
    @guests = [@guest1, @guest2, @guest3, @guest4, @guest5]
    # @songs_available = [@song1, @song2, @song3, @song4, @song5, @song6]


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

  def test_money_in_till
    assert_equal(0, @karaoke_bar.money_in_till)
  end

  def test_guest_enters_bar
    @karaoke_bar.guest_enters_bar(@guest1)
    assert_equal(10, @karaoke_bar.money_in_till)
    assert_equal(190, @guest1.wallet)
  end

  def test_guest_enters_bar__underage
    @new_guest = Guest.new("James", 17, "Circles", 30)
    is_allowed_in = @karaoke_bar.guest_enters_bar(@new_guest)
    assert_equal(0, @karaoke_bar.money_in_till)
    assert_equal(30, @new_guest.wallet)
    assert_equal(false, is_allowed_in)
  end

  def test_add_to_room_tab
    @karaoke_bar.add_to_room_tab(@room1, 100)
    assert_equal(100, @room1.room_tab)
  end

  def test_guest_buys_drink
    @karaoke_bar.guest_buys_drink(@guest1, @drink4)
    assert_equal(50, @karaoke_bar.money_in_till)
    assert_equal(150, @guest1.wallet)
  end

  def test_guest_buys_drink__insufficient_money
    @karaoke_bar.guest_buys_drink(@guest5, @drink4)
    assert_equal(0, @karaoke_bar.money_in_till)
    assert_equal(20, @guest5.wallet)
  end

  def test_guest_buys_drink__on_tab
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    @karaoke_bar.guest_buys_drink_on_room_tab(@room1, @drink4)
    assert_equal(0, @karaoke_bar.money_in_till)
    assert_equal(200, @guest1.wallet)
    assert_equal(50, @room1.room_tab)
  end

  def test_guest_buys_drink__on_tab_insufficent_money
    @karaoke_bar.add_to_room_tab(@room1, 350)
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    @karaoke_bar.guest_buys_drink_on_room_tab(@room1, @drink4)
    assert_equal(0, @karaoke_bar.money_in_till)
    assert_equal(200, @guest1.wallet)
    assert_equal(100, @guest2.wallet)
    assert_equal(50, @guest3.wallet)
    assert_equal(350, @room1.room_tab)
  end

  def test_pay_room_tab
    @room1.add_guest_to_room(@guest1)
    @room1.add_guest_to_room(@guest2)
    @room1.add_guest_to_room(@guest3)
    @karaoke_bar.add_to_room_tab(@room1, 250)
    @karaoke_bar.pay_room_tab(@room1)
    assert_equal(250, @karaoke_bar.money_in_till)
    assert_equal(0, @guest1.wallet)
    assert_equal(0, @guest2.wallet)
    assert_equal(100, @guest3.wallet)
  end








end
