require 'terminal-table'
require './classes/book'
class Hello
  def hello(name)
    "hello #{name}"
  end
end

class Person
  attr_accessor :name, :age, :email

  def initialize(name, age, email)
    @name = name
    @age = age
    @email = email
  end
end

def class_lister(class_instances, title)
  all_attributes = []
  all_instances = []
  
  class_instances.each do |class_instance|
    instance_variables = class_instance.instance_variables
    instance_values = instance_variables.map { |var| class_instance.instance_variable_get(var) }
    
    all_attributes.concat(instance_variables.map { |var| var.to_s.gsub("@", "") })
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


book1 = Book.new("Adarsh", "bad", "2022-08-22")
book2 = Book.new("Adarsh", "bad", "2022-08-22")
book3 = Book.new("Adarsh", "bad", "2022-08-22")
class_lister([book1, book2, book3], "Book")
