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
    @guest_list = [@guest1, @guest2]
    @playlist = [@song1, @song2, @song3]
    # room: name, genre, guest_list, playlist, guest_limit
    @room = Room.new("Headbanger's Ball", "metal", @guest_list, @playlist, 20)
  end
  # 1
  def test_has_name
    assert_equal("Headbanger's Ball", @room.name)
  end
  # 2
  def test_has_genre
    assert_equal("metal", @room.genre)
  end
  # 3
  def test_has_guest_list
    assert_equal(0, @room.guest_count())
  end
  # 4
  def test_guest_check_in
    @room.check_in(@guest1)
    assert_equal(1, @room.guest_count())
  end
  # 5
  def test_guest_check_out
    @room.check_in(@guest1)
    @room.check_out(@guest1)
    assert_equal(0, @room.guest_count())
  end
  # 6
  def test_has_playlist
    assert_equal(0, @room.playlist_count())
  end
  # 7
  def test_add_song_to_playlist
    @room.add_song_to_playlist(@song1)
    assert_equal(1, @room.playlist_count())
  end

end
