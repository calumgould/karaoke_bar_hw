class Room

  attr_reader :name, :songs_available, :max_capacity, :room_tab, :guests_in_room

  def initialize(name, songs_available, room_tab)
    @name = name
    @guests_in_room = []
    @max_capacity = 3
    @songs_available = songs_available
    @room_tab = 0
  end

  def song_count
    return @songs_available.count()
  end

  def check_number_of_guests_in_room()
    return @guests_in_room.count
  end

  def add_new_song_to_room(song_to_add)
    @songs_available.push(song_to_add)
  end

  def add_guest_to_room(guest_to_add)
    if @guests_in_room.count() < @max_capacity
      @guests_in_room.push(guest_to_add)
    end
  end

  def favourite_song_is_on_list(guest)
    if @songs_available.find{ |song| song.name == guest.favourite_song}
      return "Whooo!!"
    else
      return "Awwww"
    end
  end

  def add_money_to_room_tab(amount)
    @room_tab += amount
  end

  def total_customer_room_cash()
    total = 0
    for guest in @guests_in_room
      total += guest.wallet
    end
    return total
  end

end
