require './classes/book'
require './classes/label'
require './classes/data-controller/reader_writer'

class App
    def initialize
        @books = read_from_json_file("./data/book.json", Book)
        @labels = read_from_json_file("./data/label.json", Label)
    end

    def list_all_books
        class_lister(@books, "Books")
    end

    def list_all_labels
        class_lister(@labels, "Labels")
    end
    
    def create_a_book
        puts 'to create book please enter the following information:'
        print "Enter book's published date(format: YYYY/MM/DD): "
        publish_date = Date.parse(gets.chomp)
        print "Enter book's publisher: "
        publisher = gets.chomp
        print "Enter book's cover state: "
        cover_state = gets.chomp
        book = Book.new(publisher, cover_state, publish_date)
        @books << book
        label = create_label
        label.add_item(book)
        @labels << label
        puts 'Book added successfully!'
    end

    def exit_and_save
        write_to_json_file("./data/book.json", @books)
        write_to_json_file("./data/label.json", @labels)
        puts "bye bye"
    end

    private 
    
    def create_label
        print 'Enter label title: '
        title = gets.chomp
        print 'Enter label color: '
        color = gets.chomp
        label = Label.new(title, color)
        label
    end
end