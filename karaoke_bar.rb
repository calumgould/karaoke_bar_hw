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
    if guest.age >= 18
    @money_in_till += @entry_fee
    guest.remove_money_from_guest(@entry_fee)
    else
      return false
    end
  end

  def guest_buys_drink(guest, drink)
    if guest.wallet > drink.price
      @money_in_till += drink.price
      guest.remove_money_from_guest(drink.price)
    end
  end

  def add_to_room_tab(room, amount)
    room.add_money_to_room_tab(amount)
  end

  def guest_buys_drink_on_room_tab(room, drink)
    if room.total_customer_room_cash() > room.room_tab
      room.add_money_to_room_tab(drink.price)
    end
  end

  def pay_room_tab(room)
    @money_in_till += room.room_tab
    total_paid = 0
    until total_paid == room.room_tab
      for guest in room.guests_in_room
        total_paid += guest.wallet
        guest.remove_money_from_guest(guest.wallet)
      end
      if total_paid > room.room_tab
        change = total_paid - room.room_tab
        guest.add_money_to_guest(change)
      end
      return total_paid
    end
  end
  #not the most elegant way to do it but i think it works?? only issue is that the last guest to pay always gets the change, so guest 3 ends up with double their money whilst the other 2 guests are cleaned out.





end
