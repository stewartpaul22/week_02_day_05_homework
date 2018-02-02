require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test

  # a room should have a list of guests
  def setup
    @song1 = Song.new("Paranoid", "Black Sabbath", "metal")
    @song2 = Song.new("Breaking the Law", "Judas Priest", "metal")
    @song3 = Song.new("One", "Metallica", "metal")
    @guest1 = Guest.new("Beavis", 50.00, @song1)
    @guest2 = Guest.new("Butthead", 40.00, @song2)
    @room_guest_list1 = [@guest1, @guest2]
    @playlist = [@song1, @song2, @song3]
    # room: name, genre, room_guest_list, playlist, guest_limit
    @room1 = Room.new("Headbanger's Ball", "metal", @room_guest_list1, @playlist)
    @room2 = Room.new("Motor City", "motown and soul", @room_guest_list1, @playlist)
  end
  # 1
  def test_has_name
    assert_equal("Headbanger's Ball", @room1.name)
  end
  # 2
  def test_has_genre
    assert_equal("metal", @room1.genre)
  end
  # 3
  def test_has_room_guest_list
    assert_equal(0, @room1.guest_count())
  end
  # 4
  def test_guest_check_in
    @room1.check_in(@guest1)
    assert_equal(1, @room1.guest_count())
  end
  # 5
  def test_guest_check_out
    @room1.check_in(@guest1)
    @room1.check_out(@guest1)
    assert_equal(0, @room1.guest_count())
  end
  # 6
  def test_has_playlist
    assert_equal(0, @room1.playlist_count())
  end
  # 7
  def test_add_song_to_playlist
    @room1.add_song_to_playlist(@song1)
    assert_equal(1, @room1.playlist_count())
  end
  # 8
  def test_is_room_full__is_full
    20.times { @room1.check_in(@guest1)}
    assert_equal(true, @room1.is_room_full())
  end
  # 9
  # def test_add_guest_to_another_room
  #   # if a guest's chosen room is full, add cust to next room that is not full
  #   20.times { @room1.check_in(@guest1)}
  #   10.times { @room2.check_in(@guest1)}
  #   #confirm guest's current location
  #
  #   assert_equal(@room2, #guest_current_location)
  #
  # end

end
