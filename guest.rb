class Guest

  attr_reader :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = 0.00
    @fav_song = fav_song
    ### add a property to confirm guest location ###
  end

  def add_funds_to_wallet(amount)
    @wallet += amount
  end

end
