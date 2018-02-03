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
    # arrange
    @venue.admit_guest(@guest1)
    # act
    @venue.send_guest_to_room(@guest1, @room1)
    # assert
    assert_equal(0, @venue.guest_count())
    assert_equal(1, @room1.guest_count())
  end
  # 8
  def test_allocate_guest_to_room__space_unavailable
    # arrange
    @venue.admit_guest(@guest1)
    20.times {@room1.check_in(@guest1)}
    # act
    @venue.send_guest_to_room(@guest1, @room1)
    # assert
    assert_equal(1, @venue.guest_count())
    assert_equal(20, @room1.guest_count())
  end
  # 9
  # def test_take_entry_fee_from_guest
  #   # arrange
  #   @venue.admit_guest(@guest1)
  #   @guest1.add_funds_to_wallet(50.00)
  #   # act
  #   entry_fee = @guest1.debit_funds_from_wallet(5.00)
  #   @venue.add_funds_to_till
  #   # assert
  #
  # end

end
