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

def self.create #constructor
  song = self.new
  song.save
  song
end

def self.new_by_name(name)
  new_song = self.new
  new_song.name = name
  new_song
end

def self.create_by_name(song)
  create = self.new
  create.name = song 
  create.save
  create
end

def self.find_by_name(song_name)
  self.all.find {|song| song.name == song_name}
end 

def self.find_or_create_by_name(song)
  self.find_by_name(song) || self.create_by_name(song)
end

def self.alphabetical
  @@all.sort_by {|song| song.name }
end

def self.new_from_filename(file_name)
  file_name_array = file_name.sub!(/.mp3/,'').split(" - ")
      song = self.new
      song.name = file_name_array[1]
      song.artist_name = file_name_array[0]
      song

# new_song = self.new
# artist_name = self.new
# new_song.name = file_name.split("-").last.strip.split(/.mp3/).join(" ") 
# artist_name.artist_name = file_name.split("-").first.strip


end


def self.create_from_filename(file_name)
  file_name_array = file_name.sub!(/.mp3/,'').split(" - ")
  song = self.new
  song.name = file_name_array[1]
  song.artist_name = file_name_array[0]
  song.save
  song
end

def self.destroy_all
  @@all.clear
end

end

#c.last.strip.split(/.mp3/).join("")