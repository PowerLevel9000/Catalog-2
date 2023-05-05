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
    genre = create_genre
    genre.add_item(book)
    @genres << genre
    source = create_source
    source.add_item(book)
    @sources << genre
    author = create_author
    author.add_item(book)
    @authors << author
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
    Label.new(title, color)
  end

  def create_genre
    print 'Enter genre: '
    genre_name = gets.chomp
    Genre.new(genre_name)
  end

  def create_source
    print 'Enter name'
    name = gets.chomp
    Source.new(name)
  end

  def create_author
    print 'Enter Author First Name'
    first_name = gets.chomp
    print 'Enter Author Last Name'
    last_name = gets.chomp
    Author.new(first_name, last_name)
  end
end
