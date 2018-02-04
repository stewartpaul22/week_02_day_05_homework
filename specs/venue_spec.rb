require('minitest/autorun')
require('minitest/rg')
require_relative('../venue.rb')
require_relative('../guest.rb')
require_relative('../room.rb')

class TestVenue < MiniTest::Test

  def setup
    @guest1 = Guest.new("Beavis", 50.00, @song1)
    @guest2 = Guest.new("Butthead", 40.00, @song2)
    @room1 = Room.new("Headbanger's Ball", "metal", @guest_list1, @playlist)
    @room2 = Room.new("Motor City", "motown and soul", @guest_list1, @playlist)
    @room3 = Room.new("CheeseFest", "pop", @guest_list1, @playlist)
    @venue = Venue.new("FAME OR SHAME", @guest_list, @room_list)
  end
  # 1
  def test_has_name
    assert_equal("FAME OR SHAME", @venue.name)
  end
  # 2
  def test_has_guest_list
    assert_equal(0, @venue.guest_count())
  end
  # 3
  def test_has_room_list
    assert_equal(0, @venue.room_count())
  end
  # 4
  def test_has_till
    assert_equal(0, @venue.till())
  end
  # 5
  def test_admit_guest_to_venue
    @venue.admit_guest(@guest1)
    assert_equal(1, @venue.guest_count())
  end
  # 6
  def test_remove_guest_from_guest_list
    # arrange
    @venue.admit_guest(@guest1)
    # act
    @venue.remove_guest(@guest1)
    # assert
    assert_equal(0, @venue.guest_count())
  end
  #7
  def test_allocate_guest_to_room__space_available
    puts @venue.room_count
    # arrange
    @venue.admit_guest(@guest1)
    # act
    @venue.send_guest_to_room(@guest1, @room1)
    # assert
    assert_equal(0, @venue.guest_count())
    assert_equal(1, @room1.guest_count())
  end
  # 8
  def test_allocate_guest_to_alternative_room
    # arrange
    @venue.add_room_to_venue(@room1)
    @venue.add_room_to_venue(@room2)
    @venue.add_room_to_venue(@room3)
    20.times {@room1.check_in(@guest1)}
    10.times {@room2.check_in(@guest2)}
    10.times {@room3.check_in(@guest2)}
    # act
    @venue.send_guest_to_room(@guest1, @room1)
    # assert
    assert_equal(20, @room1.guest_count())
    assert_equal(11, @room2.guest_count())
  end
  # 9
  def test_take_entry_fee_from_guest
    # arrange
    @venue.admit_guest(@guest1)
    @guest1.add_funds_to_wallet(50.00)
    # act
    @guest1.debit_funds_from_wallet(@venue.entry_fee)
    @venue.add_funds_to_till(@venue.entry_fee)
    # assert
    assert_equal(45.00, @guest1.wallet)
    assert_equal(5.00, @venue.till)
  end
  # 10
  def test_add_room_to_room_list
    @venue.add_room_to_venue(@room1)
    # assert
    assert_equal(1, @venue.room_count())
  end
  # 11
  def test_get_venue_guest_count
    @venue.add_room_to_venue(@room1)
    @venue.add_room_to_venue(@room2)
    @venue.add_room_to_venue(@room3)
    20.times {@room1.check_in(@guest1)}
    10.times {@room2.check_in(@guest2)}
    10.times {@room3.check_in(@guest2)}
    assert_equal(40, @venue.total_guest_count())
  end

end
