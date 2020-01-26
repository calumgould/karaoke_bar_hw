class Guest

 attr_reader :name, :age, :favourite_song
 attr_accessor :wallet

  def initialize(name, age, favourite_song, wallet)
    @name = name
    @age = age
    @favourite_song = favourite_song
    @wallet = wallet
  end

  def remove_money_from_guest(amount)
    if @wallet > 0
      return @wallet -= amount
    end
  end

  def add_money_to_guest(amount)
    return @wallet += amount
  end




end
