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
    song = self.new # instantiates the song
    self.all << song # aves the song
    song # returns new song that was created
  end

  def self.new_by_name(title)
    song = self.new # instantiates the song
    song.name = title # with a name property
    song # returns new song that was created
  end

  def self.create_by_name(title)
    song = self.new # instantiates the song
    song.name = title # with a name property
    self.all << song # saves the song
    song # returns new song that was created
  end

  def self.find_by_name(title)
    self.all.find do |song|
      song.name == title
    end
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) || self.create_by_name(title)
  end



  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end



  def self.new_from_filename(filename)
    song_name = filename.split(".")[0].split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end



  def self.create_from_filename(filename)
    song_name = filename.split(".")[0].split(" - ")[1]
    artist_name = filename.split(" - ")[0]
    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    self.all << song
    song
  end



  def self.destroy_all
    self.all.clear
  end

end
