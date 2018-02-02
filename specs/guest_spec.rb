require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../room.rb')

class TestGuest < MiniTest::Test

  def setup
    @song1 = Song.new("Paranoid", "Black Sabbath", "metal")
    @guest1 = Guest.new("Paul", 50.00, @song1)
  end
  # 1
  def test_has_name
    assert_equal("Paul", @guest1.name)
  end
  # 2
  def test_has_wallet
    assert_equal(50.00, @guest1.wallet)
  end
  # 3
  def test_has_favourite_song
    assert_equal("Paranoid", @guest1.fav_song.title)
    puts @guest1.fav_song.title
  end

  def test_confirm_guest_location
    assert_equal()
  end

end
