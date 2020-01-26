class KaraokeBar

  attr_reader :name, :entry_fee, :money_in_till

  def initialize(name, rooms, guests)
    @name = name
    @rooms = rooms
    @guests = guests
    @entry_fee = 10
    @money_in_till = 0
  end

  def entry_fee
    return @entry_fee
  end

  def guest_enters_bar(guest)
    @money_in_till += @entry_fee
    guest.remove_money_from_guest(@entry_fee)
  end





end
