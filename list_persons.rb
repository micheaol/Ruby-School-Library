class ListPersons
  def self.list_persons(persons)
    puts "You don't have any person" if persons.empty?
    persons.each_with_index do |person, i|
      puts "#{i}) Name: #{person.name}, Age: #{person.age}, Id: #{person.id}"
    end
    puts
  end
end
