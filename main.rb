require './app'
require 'readline'

class Main
  attr_reader :options

  def initialize
    @options = {
      '1' => :list_all_books,
      '2' => :list_all_labels,
      '3' => :create_a_book,
      '4' => :exit_and_save
    }
  end

  def ui_genrator
    app = App.new
    breaker = 0
    putters
    while breaker != 4
      putter_ui
      user_input = Readline.readline('Enter option: ', true)
      breaker = user_input.to_i
      option = options[user_input[-1]]
      if option
        app.send(option)
        puts "\n// task end //\n\n"
      else
        puts 'Choose valid option.'
      end
    end
  end

  def putters
    puts "\n****************************************"
    puts "\n========== Welcome To Catalog ==========\n\n"
    puts "****************************************"
  end

  def putter_ui
    puts "\n========== Choose An Option ==========\n\n"
    puts "1. List all books"
    puts "2. List all labels"
    puts "3. Create A book"
    puts "4. Exit and Save "
  end  
end
main = Main.new
main.ui_genrator