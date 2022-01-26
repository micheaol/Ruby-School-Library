require_relative 'corrector'

class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def validate_name
    corrected_name = @corrector.correct_name(@name)
    @name = corrected_name
  end

  private

  def of_age?
    @age >= 18
  end
end
