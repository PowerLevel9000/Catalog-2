require 'json'
require 'terminal-table'
def write_to_json_file(file_path, array)
  return if array.empty?

  data = array.map(&:to_json)
  File.write(file_path, JSON.pretty_generate(data))
end

def read_from_json_file(file_path, class_name)
  if File.exist?(file_path)
    json_str = File.read(file_path)
    data = JSON.parse(json_str)
    data.map { |element| class_name.from_json(element) }
  else
    []
  end
end
