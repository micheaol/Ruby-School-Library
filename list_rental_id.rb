class ListRentalId
  def self.list_rental_id(persons)
    if persons.empty?
      puts "You don't have any clients, please create a client first"
    else
      print 'ID of person: '
      person_id = gets.chomp.to_i
      puts 'Rentals:'
    end

    persons.each do |person|
      if person.id == person_id.to_i
        person.rentals.each do |rental|
          puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
        end
      else
        puts 'Person no found'
      end
    end
    puts
  end
end
