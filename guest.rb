class Guest

  attr_reader :name, :wallet, :fav_song, :location

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = 0.00
    @fav_song = fav_song
    @location = nil
  end

  def add_funds_to_wallet(amount)
    @wallet += amount
  end

  def debit_funds_from_wallet(amount)
    @wallet -= amount
  end

  def cheer()
    return "YAS!"
  end

  def fav_song_on_playlist(room)
    cheer() if room.playlist.include?(@fav_song)
  end

end
