class Room

  attr_reader :name, :genre

  def initialize(name, genre, guest_list, playlist, guest_limit)
    @name = name
    @genre = genre
    @guest_list = []
    @playlist = []
  end

  def guest_count()
    return @guest_list.count()
  end

  def check_in(guest)
    @guest_list << guest
  end

  def check_out(guest)
    @guest_list.delete(guest)
  end

  def playlist_count()
    return @playlist.count()
  end

  def add_song_to_playlist(song)
    @playlist << song
  end

end
