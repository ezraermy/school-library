require_relative 'person'

class Teacher < Person
  attr_reader :specialization
  attr_accessor :role

  def initialize(age, specialization, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
    @role = 'teacher'
  end

  def can_use_services?
    true
  end
end
