require_relative 'item'
class Music < Item
  attr_accessor :on_spotify

  def initialize(on_spotify, publish_date = 'Unknown')
    super(publish_date)
    @on_spotify = on_spotify
  end

	def to_json(*args)
		{
			'id' => @id,
			'on_spotify' => @on_spotify,
			'publish_date' => @publish_date,
			'label' => @label,
			'archived' => @archived,
			'genre' => @genre
		}.to_json(*args)
	end
	
	def self.from_json(json)
		data = JSON.parse(json)
		music = Music.new(data['publisher'], data['cover_state'], data['publish_date'])
        music.instance_variable_set(:@id, data['id'])
        music.instance_variable_set(:@lable, data['lable'])
        music.instance_variable_set(:@genre, data['genre'])
        music.instance_variable_set(:@archived, data['archived'])
		music
	end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
