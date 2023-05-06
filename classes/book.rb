require_relative './item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def to_json(*args)
    {
      'id' => id,
      'publisher' => @publisher,
      'cover_state' => @cover_state,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'label' => @label,
      'genre' => @genre,
      'source' => @source,
      'author' => @author
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    book = Book.new(data['publisher'], data['cover_state'], data['publish_date'])
    book.instance_variable_set(:@id, data['id'])
    book.instance_variable_set(:@label, data['label'])
    book.instance_variable_set(:@genre, data['genre'])
    book.instance_variable_set(:@archived, data['archived'])
    book.instance_variable_set(:@source, data['source'])
    book.instance_variable_set(:@author, data['author'])
    book
  end

  private

  def can_be_archived?
    super || cover_state == 'bad' ? true : false
  end
end
