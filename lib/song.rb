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
    #set variable for song
    song = self.new
    song.save
  song
  end

  def self.new_by_name(name)
    #instantiate new song
    song = self.new
    #create name property
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name  }
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
#  @@all.sort { |a,b| a.name <=> b.name}
  # @@all.each.sort { |a, b| a.name <=> b.name}
  @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
   name = filename.chomp(".mp3").split(" - ")
   #sets new instance of song with name and artist name
   song = self.new
   song.name = name[1]
   song.artist_name = name[0]
   song
  end


  def self.create_from_filename(filename)
    name = filename.chomp(".mp3").split(" - ")
    #sets new instance of song with name and artist name
    song = Song.new
    song.name = name[1]
    song.artist_name = name[0]
    song.save
    song
   end

   def self.destroy_all
     self.all.clear #using this allows to change self variable without altering other code in future
    # other options same result
    # @@all = []
    # @@all.clear
    #though you could use ALL = [] to pass the test, this shouldnt be used because it is a changed constant.
   end
end
