require_relative 'classroom'
require_relative 'student'

classroom = Classroom.new('A101')
student = Student.new(1, 18, classroom, 'John Doe')

classroom.add_student(student)

puts student.classroom.label # Output: A101
puts classroom.students.length # Output: 1
puts classroom.students[0].name # Output: John Doe
