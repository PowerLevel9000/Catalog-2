require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def to_json(*args)
    {
      'id' => id,
      'last_played_at' => @last_played_at,
      'multiplayer' => @multiplayer,
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
    game = Game.new(data['multiplayer'], data['last_played_at'], data['publish_date'])
    game.instance_variable_set(:@id, data['id'])
    game.instance_variable_set(:@label, data['label'])
    game.instance_variable_set(:@genre, data['genre'])
    game.instance_variable_set(:@genre, data['genre'])
    game.instance_variable_set(:@genre, data['genre'])
    game.instance_variable_set(:@archived, data['archived'])
    game
  end

  private

  def can_be_archived?
    super && (Date.today.year - Date.parse(@last_played_at.to_s).year > 2)
  end
end
