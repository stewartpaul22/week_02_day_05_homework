require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')

class TestRoom < MiniTest::Test

  # a room should have a list of guests
  def setup
    song1 = Song.new("Paranoid", "Black Sabbath", "metal")
    song2 = Song.new("Breaking the Law", "Judas Priest", "metal")
    song3 = Song.new("One", "Metalica", "metal")
    @guest1 = Guest.new("Beavis", 50.00, song1)
    @guest2 = Guest.new("Butthead", 40.00, song2)
    @guest_list = [@guest1, @guest2]
    @playlist = [song1, song2, song3]
    # room: name, genre, guest_list, playlist, guest_limit
    @room = Room.new("Headbanger's Ball", "metal", @guest_list, @playlist, 20)
  end


end
