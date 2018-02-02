require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
    @song = Song.new("Paranoid", "Black Sabbath", "metal")
  end
  # 1
  def test_has_title
    assert_equal("Paranoid", @song.title)
  end
  # 2
  def test_has_artitst
    assert_equal("Black Sabbath", @song.artist)
  end
  # 3
  def test_has_genre
    assert_equal("metal", @song.genre)
  end

end
