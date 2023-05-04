require 'json'
require 'terminal-table'
def write_to_json_file(labels, file_path)
  data = labels.map(&:to_json)
  File.write(file_path, JSON.pretty_generate(data))
end

def read_from_json_file(file_path, class_name)
  json_str = File.read(file_path)
  data = JSON.parse(json_str)
  data_arr = data.map { |data| class_name.from_json(data) }
  class_lister(data_arr, "#{class_name}")
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