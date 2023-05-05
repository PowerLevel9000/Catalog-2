class Source
  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.source = @id
    @items << item.id unless @items.include?(item.id)
  end

  def to_json(*args)
    {
      'id' => @id,
      'name' => @name,
      'items' => @items
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    source = Source.new(data['name'])
    source.instance_variable_set(:@id, data['id'])
    source.instance_variable_set(:@items, data['items'])
    source
  end
end
