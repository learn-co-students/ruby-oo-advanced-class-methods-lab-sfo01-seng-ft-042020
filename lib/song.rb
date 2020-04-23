require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    @@all << song
    song
  end

  def self.create_by_name(title)
    self.new_by_name(title)
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    create_by_name(name) if find_by_name(name).nil? 
    find_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|obj| obj.name}
  end

  def self.new_from_filename(filename)
      hyphen = filename.index("-")
      title = filename.slice(hyphen + 2...-4)
      artist = filename[0..hyphen - 2]
      song = self.new
      song.name = title
      song.artist_name = artist
      @@all << song
      song
  end

  def self.create_from_filename(filename)
    new_from_filename(filename)
  end

  def self.destroy_all
    @@all = []
  end
end

song1 = Song.find_or_create_by_name("All Directions")
song2 = Song.find_or_create_by_name("A Crow Left of the Murder")
song3 = Song.find_or_create_by_name("Zzzzzzzz")
song4 = Song.new_from_filename("Son Lux - Easy.mp3")
puts Song.alphabetical