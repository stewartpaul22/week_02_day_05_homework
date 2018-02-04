require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new("Paranoid", "Black Sabbath", "metal")
    @guest1 = Guest.new("Paul", 50.00, @song1)
    @room1 = Room.new("Headbanger's Ball", "metal")
  end
  # 1
  def test_has_name
    assert_equal("Paul", @guest1.name)
  end
  # 2
  def test_has_wallet
    assert_equal(0.00, @guest1.wallet)
  end
  # 3
  def test_has_favourite_song
    assert_equal("Paranoid", @guest1.fav_song.title)
  end
  # 4
  def test_add_funds_to_guest_wallet
    @guest1.add_funds_to_wallet(50.00)
    assert_equal(50.00, @guest1.wallet)
  end
  #5
  def test_guest_can_cheer
    assert("YAS!", @guest1.cheer())
  end
  # 6
  def test_guest_fav_song_on_playlist
    # arrange
    @room1.add_song_to_playlist(@song1)
    @room1.check_in(@guest1)
    # act
    response = @guest1.fav_song_on_playlist(@room1)
    # assert
    assert_equal("YAS!", response)
  end
  # 7
  def test_get_guest_location
    assert_equal(nil, @guest1.location)
  end

  ### add a test to check guest's location i.e. in a room or venue_guest_list ###

end
