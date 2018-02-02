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


end
