class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
  end

  def self.new_by_filename(file)
    split = file.split(' - ')
    new_song = Song.new(split[1])
    new_song.artist_name = split[0]
    new_song
  end
end
