require_relative 'item'

class Movie < Item
  attr_accessor :silet

  def initialize(publish_date, silet: true)
    super(publish_date)
    @silet = silet
  end

  def to_json(*args)
    {
      'id' => @id,
      'silet' => @silet,
      'publish_date' => @publish_date,
      'label' => @label,
      'archived' => @archived,
      'source' => @source,
      'author' => @author,
      'genre' => @genre
    }.to_json(*args)
  end

  def self.from_json(json)
    data = JSON.parse(json)
    movie = Movie.new(data['publish_date'], silet: data['silet'])
    movie.instance_variable_set(:@id, data['id'])
    movie.instance_variable_set(:@label, data['label'])
    movie.instance_variable_set(:@genre, data['genre'])
    movie.instance_variable_set(:@source, data['source'])
    movie.instance_variable_set(:@author, data['author'])
    movie.instance_variable_set(:@archived, data['archived'])
    movie
  end

  private

  def can_be_archived?
    super || @silet
  end
end
