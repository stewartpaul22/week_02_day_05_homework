class Venue

  attr_reader :name, :till, :entry_fee

  def initialize(name, guest_list, room_list)
    @name = name
    @venue_guest_list = [] # holding area for guests
    @room_list = []
    @till = 0.00
    @entry_fee = 5.00
  end

  def guest_count()
    return @venue_guest_list.count()
  end

  def room_count()
    return @room_list.count()
  end

  def admit_guest(guest)
    @venue_guest_list << guest
  end

  def remove_guest(guest)
    @venue_guest_list.delete(guest)
  end

  def send_guest_to_room(guest, room)
    if !room.is_room_full()
      remove_guest(guest)
      room.check_in(guest)
    else
      @room_list.each do |alt_room|
        if !alt_room.is_room_full()
          remove_guest(guest)
          alt_room.check_in(guest)
        end
      end
    end
  end

  def add_funds_to_till(amount)
    @till += amount
  end

  def add_room_to_venue(room)
    @room_list << room
  end

  def total_guest_count()
    total_guests = 0
    @room_list.each do |room|
      total_guests += room.guest_count
    end
    return total_guests
  end

end
