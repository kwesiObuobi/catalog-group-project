require_relative 'genre'
require 'date'

class Item
  attr_accessor :id, :published_date, :genre, :source, :label, :author, :archived

  def initialize(published_date, archived: false)
    @id = Random.rand(1..1000)
    @published_date = published_date
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_source(source)
    @source = source
  end

  def add_author(author)
    @author = author
  end

  def add_label(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Date.today.year - Date.parse(@published_date).year > 10
  end
end
