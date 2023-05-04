class Item
    attr_accessor :genre, :author, :source, :label, :publish_date
    attr_reader :id, :archived
    def initialize(date)
        @id = rand(1..1000)
        @publish_date = date
    end
end