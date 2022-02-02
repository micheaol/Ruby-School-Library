class ListRentalId
  def self.list_rental_id(rentals)
    print 'ID of person: '
    person_id = gets.chomp.to_i
    puts 'Rentals: '
    persons_found = 0
    rentals.each do |rental|
      next unless rental['person']['id'] == person_id.to_i

      puts "Date: #{rental['date']}, Book: \"#{rental['book']['title']}\" by #{rental['book']['author']}"
      persons_found += 1
    end
    puts 'Person not found' if persons_found.zero?
    puts
  end
end
