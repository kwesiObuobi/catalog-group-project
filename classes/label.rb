class Label
  attr_accessor :items, :title, :color

  def initialize(title, color)
    @id = Random.rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_items=(item)
    @items << item
    item.label = self
  end
end
