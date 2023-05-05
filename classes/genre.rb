class Genre
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.genre = id
    @items << item.id unless @items.include?(item.id)
  end

  def to_json(*args)
    {
      'id' => id,
      'name' => @name,
      'items' => @items
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    genre = Genre.new(data['name'])
    genre.instance_variable_set(:@id, data['id'])
    genre.instance_variable_set(:@id, data['items'])
    genre
  end
end
