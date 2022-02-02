require 'json'
class ListPersons
  def self.list_persons(persons)
    puts "You don't have any person" if persons.empty?
    file = File.read('persons.json')
     hash = JSON.parse(file)
     hash.each do | el | puts "[#{el["json_class"]}], age: #{el["age"]}, name: #{el["name"]}" end
    puts
  end
end
