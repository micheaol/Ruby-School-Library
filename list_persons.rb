require 'json'
class ListPersons
  def self.list_persons(persons)
    puts "You don't have any person" if persons.empty?
    file = File.read('persons.json')
     hash = JSON.parse(file)
     puts hash
    puts
  end
end
