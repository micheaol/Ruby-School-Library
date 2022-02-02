class Corrector
  def correct_name(name)
    first_letter = name[0]

    if first_letter.upcase == first_letter && name.length < 10
      name
    else
      name.capitalize.slice(0..9)
    end
  end
end
