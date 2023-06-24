require_relative 'nameable'
require_relative 'base_deco'
require_relative 'capitalize_deco'
require_relative 'trimmer_deco'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :parent_permission, :rentals

  def initialize(age, parent_permission, name = 'Unknown')
    super()
    @id = Random.rand(1..2000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
