class Room

  attr_reader :name, :genre, :room_guest_list, :playlist

  def initialize(name, genre)
    @name = name
    @genre = genre
    @room_guest_list = []
    @playlist = []
    @guest_limit = 20
  end

  def guest_count()
    return @room_guest_list.count()
  end

  def check_in(guest)
     @room_guest_list << guest unless is_room_full()
  end

  def check_out(guest)
    @room_guest_list.delete(guest)
  end

  def playlist_count()
    return @playlist.count()
  end

  def add_song_to_playlist(song)
    @playlist << song
  end

  def is_room_full()
    return @room_guest_list.count() == @guest_limit
  end

end
