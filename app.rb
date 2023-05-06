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
      line += '-'
    end
    line += "--+\n"
    puts "#{line}| #{string} |#{line}\n"
  end

  def create_a_book
    ui_title('To create book please enter the following Information')
    publish_date = date_giver(method(:create_a_book))
    print "Enter book's publisher: "
    publisher = gets.chomp
    print "Enter book's cover state: "
    cover_state = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    symbol_controler(book)
    ui_title('Book Created successfully!')
  end

  def create_a_music
    ui_title('To create Music please enter the following Information')
    publish_date = date_giver(method(:create_a_music))
    print "Is it on 'Spotify' [Y/N] : "
    on_spotify = gets.chomp
    music = on_spotify.downcase == 'n' ? Music.new(publish_date, false) : Music.new(publish_date)
    @musics << music
    symbol_controler(music)
    ui_title('Music Created successfully!')
  end

  def create_a_game
    ui_title('To create Game please enter the following Information')
    publish_date = date_giver(method(:create_a_game))
    print "Last Played on  : "
    last_played_at = Date.parse(gets.chomp)
    print "Is this game multiplayer ? [Y/N] : "
    multiplayer = gets.chomp
    game = ""
    if multiplayer.downcase == "y"
      print "Max number of players can play together : "
      number = gets.chomp.to_i
      game = Game.new(last_played_at, publish_date, number)
    else
      game = Game.new(last_played_at, publish_date)
    end
    @games << game
    symbol_controler(game)
    ui_title('Music Created successfully!')
  end

  def create_a_movie
    ui_title('To create Movie please enter the following Information')
    publish_date = date_giver(method(:create_a_movie))
    print "Is it on 'Silet' [Y/N] : "
    silet = gets.chomp
    movie = silet.downcase == 'n' ? Movie.new(publish_date, false) : Movie.new(publish_date)
    @movies << movie
    symbol_controler(movie)
    ui_title('Movie Created successfully!')
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
    ui_title('Bye Bye')
  end

  private

  def create_label
    print 'Enter label title: '
    title = gets.chomp
    print 'Enter label color: '
    color = gets.chomp
    label = Label.new(title, color)
    @labels << label
    ui_title("Label #{title.upcase} with color #{color.upcase} Created successfully!")
    label
  end

  def date_giver(creater)
    print "Enter book's published date(format: YYYY/MM/DD): "
    begin
      publish_date = Date.parse(gets.chomp)
    rescue StandardError
      puts 'invalid input try again'
      creater.call
    end
    publish_date
  end

  def create_genre
    print 'Enter genre: '
    genre_name = gets.chomp
    genre = Genre.new(genre_name)
    @genres << genre
    ui_title("Genre #{genre_name.upcase} Created successfully!")
    genre
  end

  def create_source
    print 'Enter name: '
    name = gets.chomp
    source = Source.new(name)
    @sources << source
    ui_title("Source #{name.upcase} Created successfully!")
    source
  end

  def create_author
    print 'Enter Author First Name : '
    first_name = gets.chomp
    print 'Enter Author Last Name : '
    last_name = gets.chomp
    author = Author.new(first_name, last_name)
    @authors << author
    ui_title("Author #{first_name.upcase} #{last_name.upcase} Created successfully!")
    author
  end

  def finder(class_instance_array, id)
    return if class_instance_array.empty?

    class_instance_array.find { |element| element.id == id }
  end

  def symbol_controler(item)
    puts "\n---------------\n choose Symbols \n---------------\n"
    source = option_giver(@sources, 'Source', method(:create_source))
    source == 'No Item' ? '' : source.add_item(item)

    author = option_giver(@authors, 'Author', method(:create_author))
    author == 'No Item' ? '' : author.add_item(item)

    genre = option_giver(@genres, 'Genre', method(:create_genre))
    genre == 'No Item' ? '' : genre.add_item(item)

    label = option_giver(@labels, 'Label', method(:create_label))
    label == 'No Item' ? '' : label.add_item(item)
  end

  def option_giver(class_instance_array, class_title, symbol_fun_creator)
    ui_title("Select #{class_title} by ID or Create #{class_title}")
    class_lister(class_instance_array, class_title)
    puts '1. Select by Id'
    puts '2. Creat a new one'
    puts "3. No #{class_title} for this Item"
    print 'Enter option : '
    option = gets.chomp.to_i
    case option
    when 1
      print 'Enter the ID : '
      id = gets.chomp.to_i
      finder(class_instance_array, id)
    when 2
      ui_title("Enter following data Correctly to create #{class_title}")
      symbol_fun_creator.call
    when 3
      'No Item'
    else
      puts "\n// Invalid input //\\n"
      ui_title('Try Again')
      option_giver(class_instance_array, class_title, symbol_fun_creator)
    end
  end

  def class_lister(class_instances, title)
    if class_instances.empty?
      ui_title('nothing at the moment')
      return
    end
    all_attributes = []
    all_instances = []

    class_instances.each do |class_instance|
      instance_variables = class_instance.instance_variables
      instance_values = instance_variables.map { |var| class_instance.instance_variable_get(var) }

      all_attributes.concat(instance_variables.map { |var| var.to_s.gsub('@', '') })
      all_instances << instance_values
    end

    all_attributes.uniq!

    table = Terminal::Table.new do |t|
      t.title = "#{title} table of content"
      t.headings = all_attributes
      t.rows = all_instances
    end
    puts table
  end
end
