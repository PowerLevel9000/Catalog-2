require 'date'

class Item
    attr_accessor :genre, :author, :source, :label, :publish_date
    attr_reader :id, :archived
    def initialize(date)
        @id = rand(1..1000)
        @publish_date = date
        @archived = false
    end

    def move_to_archive
        if can_be_archived?
            @archived = true
        end
    end

    private

    def can_be_archived?
        (Time.now.year - Date.parse(@publish_date).year) > 10
    end
end