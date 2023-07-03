class Item
  def initialize(published_date, archived)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_source(source)
    @source = source
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
  end
end
