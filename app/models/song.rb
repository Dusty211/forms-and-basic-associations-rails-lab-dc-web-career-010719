class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def genre_name=(name)
    genre = Genre.find_or_create_by(name: name)
    self.genre = genre
  end

  def genre_name
    self.genre.name if self.genre
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by(name: name)
    self.artist = artist
  end

  def artist_name
    self.artist.name if self.artist
  end

  def note_contents=(notes)
    notes.each do |note|
      if note.strip != ''
        self.notes.build(content: note)
      end
    end
  end

  def note_contents
    self.notes.map &:content
  end

end
