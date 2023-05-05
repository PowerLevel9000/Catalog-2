class Label
  attr_accessor :title, :color

  def initialize(title, color)
    @id = rand(1..1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = @id
    @items << item.id unless @items.include?(item.id)
  end

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    label = Label.new(data['title'], data['color'])
    label.instance_variable_set(:@id, data['id'])
    label.instance_variable_set(:@items, data['items'])
    label
  end
end

################# caution open this at your own risk also for testing  #######################
# label1 = Label.new("action", "red")
# label2 = Label.new("drama", "yellow")
# puts label1.to_json
# label1.add_item(label1)
# puts label1.to_json
# item1 = Item.new("2022/12/28")
# item2 = Item.new("2022/11/28")
# item3 = Item.new("2022/10/28")

# label1.add_item(item1)
# label1.add_item(item2)
# label1.add_item(item3)
# label2.add_item(item1)
# label2.add_item(item2)
# label2.add_item(item3)

# label4 = Label.new("romance", "yellow")
# label4.add_item("new item")

# write_to_json_file([label1, label2], "./data/label.json")
# puts read_from_json_file("./data/label.json", Label)
