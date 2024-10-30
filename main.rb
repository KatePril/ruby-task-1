require_relative 'student'
require 'date'

lucy = Student.new("Lucy", "Evans", Date.new(2006, 11, 24))
emma = Student.new("Emma", "Evans", Date.new(2006, 11, 27))
emma1 = Student.new("Emma", "Brown", Date.new(2006, 3, 24))

print "#{lucy.name} #{lucy.surname} age: ", lucy.calculate_age, "\n"
print "#{emma.name} #{emma.surname} age: ", emma.calculate_age, "\n"
print "#{emma1.name} #{emma1.surname} age: ", emma1.calculate_age, "\n"

name = "Emma"
puts "\nStudents named '#{name}':"
puts Student.get_student_by_name(name)
age = 17
puts "\nStudents aged #{age}:"
puts Student.get_students_by_age(age)

puts "\nAll students:"
puts Student.students
Student.add_student(lucy)
puts "\nAll students:"
puts Student.students

print "\nRemoved: ", Student.remove_student(lucy), "\n"
puts "\nAll students:"
puts Student.students