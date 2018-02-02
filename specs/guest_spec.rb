require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestGuest < MiniTest::Test

  def setup
    @guest = Guest.new("Paul", 50.00, )
  end

end
