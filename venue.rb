class Venue

  attr_reader :name

  def initialize(name, guest_list, room_list)
    @name = name
    @guest_list = []
    @room_list = room_list
    @till = 0
  end

  def guest_count()
    return @guest_list.count()
  end

end
