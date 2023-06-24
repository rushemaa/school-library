require_relative 'person'
class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, parent_permission, name = 'unknown')
    super(age, parent_permission, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
