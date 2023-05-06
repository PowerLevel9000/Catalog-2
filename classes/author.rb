class Author
  attr_accessor :first_name, :last_name
  attr_reader :id, :items

  def initialize(first_name, last_name)
    @id = rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    item.author = id
    @items << item.id unless @items.include?(item.id)
  end

  def to_json(*args)
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    author = Author.new(data['first_name'], data['last_name'])
    author.instance_variable_set(:@id, data['id'])
    author.instance_variable_set(:@items, data['items'])
    author
  end
end
