class Room

  attr_reader :name, :genre, :guest_list

  def initialize(name, genre, guest_list, playlist)
    @name = name
    @genre = genre
    @guest_list = []
    @playlist = []
    @guest_limit = 20
  end

  def guest_count()
    return @guest_list.count()
  end

  def check_in(guest)
     @guest_list << guest unless is_room_full()
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

  def is_room_full()
    return @guest_list.count() == @guest_limit
  end

end
