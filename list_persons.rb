class ListPersons
  def self.list_persons(persons)
    puts "You don't have any person" if persons.empty?
    File.open('persons.json', 'r') do |file|
      puts file.readlines()

  end
    puts
  end
end
