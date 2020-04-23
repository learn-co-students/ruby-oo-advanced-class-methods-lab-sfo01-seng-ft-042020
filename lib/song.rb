require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.all 
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(name)
    # binding.pry
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end



  def self.find_by_name(name)
    # binding.pry
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical 
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    song_name = parsed[1].gsub(".mp3", "")
    
    artist_name = parsed[0]
    song = self.new_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(filename)
    parsed = filename.split(" - ")
    song_name = parsed[1].gsub(".mp3", "")
    
    artist_name = parsed[0]
    song = self.create_by_name(song_name)
    song.artist_name = artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end
end

