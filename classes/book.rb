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
            'lable' => @label,
            'genre' => @genre
        }.to_json(*args)
    end
    
    def self.from_json(json)
        data = JSON.parse(json)
        book = Book.new(data['publisher'], data['cover_state'], data['publish_date'])
        book.instance_variable_set(:@id, data['id'])
        book.instance_variable_set(:@lable, data['lable'])
        book.instance_variable_set(:@genre, data['genre'])
        book.instance_variable_set(:@archived, data['archived'])
        book
    end

    private

    def can_be_archived?
        super || cover_state == 'bad' ? true : false
    end
end