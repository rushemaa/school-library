require_relative 'nameable'

class BaseDeco < Nameable
  attr_accessor :nameable

  def initialize(namea)
    super()
    @nameable = namea
  end

  def correct_name
    @nameable.correct_name
  end
end
