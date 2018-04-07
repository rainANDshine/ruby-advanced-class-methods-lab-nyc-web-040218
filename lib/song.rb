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
    song.save
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
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.select{|song| song.name == name}.first
  end

  def self.find_or_create_by_name(name)
    if self.all.any? {|song| song.name == name}
      self.find_by_name(name)
    else
      self.create_by_name(name)
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
