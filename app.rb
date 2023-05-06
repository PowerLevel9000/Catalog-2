require './classes/book'
require './classes/label'
require './classes/music'
require './classes/genre'
require './classes/game'
require './classes/author'
require './classes/movie'
require './classes/source'
require './classes/data-controller/reader_writer'

class App
  def initialize
    @books = read_from_json_file('./data/book.json', Book)
    @labels = read_from_json_file('./data/label.json', Label)
    @musics = read_from_json_file('./data/music.json', Music)
    @genres = read_from_json_file('./data/genre.json', Genre)
    @games = read_from_json_file('./data/game.json', Game)
    @authors = read_from_json_file('./data/author.json', Author)
    @movies = read_from_json_file('./data/movies.json', Movie)
    @sources = read_from_json_file('./data/source.json', Source)
  end

  def list_all_books
    class_lister(@books, 'Books')
  end

  def list_all_labels
    class_lister(@labels, 'Labels')
  end

  def list_all_music
    class_lister(@musics, 'Music')
  end

  def list_all_genre
    class_lister(@genres, 'Genre')
  end

  def list_all_game
    class_lister(@games, 'Game')
  end

  def list_all_author
    class_lister(@authors, 'Author')
  end

  def list_all_movie
    class_lister(@movies, 'Movie')
  end

  def list_all_source
    class_lister(@sources, 'Source')
  end

  def ui_title(string)
    line = "\n+"
    string.length.times do
      line += "-"
    end
    line += "\n"
    puts "#{line}#{string}#{line}"
  end

  def create_a_book
    ui_title("To create book please enter the following Information")
    print "Enter book's published date(format: YYYY/MM/DD): "
    publish_date = Date.parse(gets.chomp)
    print "Enter book's publisher: "
    publisher = gets.chomp
    print "Enter book's cover state: "
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    symbol_controler(book)
    puts 'Book added successfully!'
  end

  def exit_and_save
    write_to_json_file('./data/book.json', @books)
    write_to_json_file('./data/label.json', @labels)
    write_to_json_file('./data/music.json', @musics)
    write_to_json_file('./data/genre.json', @genres)
    write_to_json_file('./data/author.json', @authors)
    write_to_json_file('./data/source.json', @sources)
    write_to_json_file('./data/game.json', @games)
    write_to_json_file('./data/movie.json', @movies)
    puts 'bye bye'
  end

  private

  def create_label
    print 'Enter label title: '
    title = gets.chomp
    print 'Enter label color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    ui_title("Label #{title} with #{color} Created successfully")
    label
  end

  def create_genre
    print 'Enter genre: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
    genre
  end

  def create_source
    print 'Enter name: '
    name = gets.chomp
    source = Source.new(name)
    @sources << source
    source
  end

  def create_author
    print 'Enter Author First Name'
    first_name = gets.chomp
    print 'Enter Author Last Name'
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    author
  end

  def finder(class_instance_array, id)
    if class_instance_array.length == 0
      return
    end
    class_instance_array.find { |element| element.id == id  }
  end

  def symbol_controler(item)
    puts "\n---------------\n choose Symbols \n---------------\n"
    source = option_giver(@sources, "Source", method(:create_source))
    source.add_item(item)
    author = option_giver(@authors, "Author", method(:create_author))
    author.add_item(item)
    genre = option_giver(@genres, "Genre", method(:create_genre))
    genre.add_item(item)
    label = option_giver(@labels, "Label", method(:create_label))
    label.add_item(item)
  end

  def option_giver(class_instance_array, class_title, symbol_fun_creator)
    puts "Select #{class_title} by ID or Create #{class_title}"
    class_lister(class_instance_array, class_title)
    puts "1. Select by Id"
    puts "2. Creat a new one"
    print "Enter option : "
    option = gets.chomp.to_i
    if option == 1
      print "Enter the ID : "
      id = gets.chomp.to_i
      return finder(class_instance_array, id)
    elsif option == 2
      puts "Enter following data Correctly to create #{class_title}"
      return symbol_fun_creator.call
    else
      puts "\n/\/\ Invalid input /\/\\n"
      puts "try again"
      return option_giver(class_instance_array, class_title, symbol_fun_creator)
    end
  end
end
