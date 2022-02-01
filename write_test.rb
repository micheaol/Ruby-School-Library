require 'json'

def write()
  hash = {"name" => "Carlos", "age" => "34", "parent_permission" => "true"}
  File.write("persons.json", JSON.dump(hash)) 
end

write
