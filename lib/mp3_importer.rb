require 'pry'

class MP3Importer
  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    song_arr = Dir.entries(path)
    song_arr.select { |entry| entry.end_with?('.mp3') }
  end

  def import
    files.each do |song|
      Song.new_by_filename(song)
    end
  end
end
