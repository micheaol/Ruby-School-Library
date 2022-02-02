class ListPersons
  def self.list_persons(persons)
    puts "You don't have any person" if persons.empty?
    persons.each_with_index do |person, i|
      puts "#{i}) [#{person['json_class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    puts
  end
end
