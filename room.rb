class Room

  attr_reader :name, :songs_available

  def initialize(name, songs_available)
    @name = name
    @max_capacity = 2
    @songs_available = songs_available
  end

  def song_count
    return @songs_available.count()
  end

  def add_new_song_to_room(song_to_add)
    @songs_available.push(song_to_add)
  end

end
