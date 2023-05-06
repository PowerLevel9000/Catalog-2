require './app'
require 'readline'

class Main
  attr_reader :options

  def initialize
    @options = {
      '1' => :list_all_books,
      '2' => :list_all_labels,
      '3' => :list_all_music,
      '4' => :list_all_genre,
      '5' => :list_all_game,
      '6' => :list_all_author,
      '7' => :list_all_source,
      '8' => :list_all_movie,
      '9' => :create_a_book,
      '10' => :create_a_music,
      '11' => :create_a_game,
      '12' => :create_a_movie,
      '13' => :exit_and_save
    }
  end

  def ui_genrator
    app = App.new
    breaker = 0
    putters
    while breaker != 13
      putter_ui
      user_input = gets.chomp
      breaker = user_input.to_i
      if breaker <= 13 && breaker >= 1
        app.send(@options[user_input])
        puts "\n// task end //\n\n"
      else
        puts 'Choose valid option.'
      end
    end
  end

  def putters
    puts "\n****************************************"
    puts "\n========== Welcome To Catalog ==========\n\n"
    puts '****************************************'
  end

  def putter_ui
    puts "\n========== Choose An Option ==========\n\n"
    puts '1.  List All Books'
    puts '2.  List All Labels'
    puts '3.  List All Music'
    puts '4.  List All Genre'
    puts '5.  List All Game'
    puts '6.  List All Author'
    puts '7.  List All Source'
    puts '8.  List All Movie'
    puts '9.  Create A Book'
    puts '10. Create A Music'
    puts '11. Create A Game'
    puts '12. Create A Movie'
    puts '13. Exit And Save '
    print 'Enter your option : '
  end
end
main = Main.new
main.ui_genrator
