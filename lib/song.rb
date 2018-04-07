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
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(song)
    self.all.select{|name| self.all.name == song}
  end

  def self.find_or_create_by_name(song)
    if self.all.name.include?(song)
      self.find_by_name(song)
    else
      self.create_by_name(song)
    end
  end

  def self.alphabetical
    self.all.name.sort
  end

  def self.create_from_filename(song)
    self.create_by_name(song[0..-5])
  end

  def destroy_all
    self.all.clear
  end
end
