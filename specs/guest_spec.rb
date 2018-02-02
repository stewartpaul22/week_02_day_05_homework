require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestGuest < MiniTest::Test

  def setup
    # song: title, artist, genre
    @song1 = Song.new("Paranoid", "Black Sabbath", "metal")
    # guest: name, wallet, fav_song
    @guest1 = Guest.new("Paul", 50.00, @song1)
  end

  def test_has_name
    assert_equal("Paul", @guest1.name)
  end

  def test_has_wallet
    assert_equal(50.00, @guest1.wallet)
  end

  def test_has_favourite_song
    assert_equal(@song1, @guest1.fav_song)
  end

end
