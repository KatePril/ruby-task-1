# frozen_string_literal: true
require 'date'

class Student
  @@students = []
  attr_reader :name
  attr_reader :surname
  attr_reader :date_of_birth

  def initialize(name, surname, date_of_birth)
    @name = name
    @surname = surname

    if date_of_birth > Date.today
      raise ArgumentError,'you entered a future date'
    end

    @date_of_birth = date_of_birth

    self.class.add_student(self)

  end

  def eql?(other)
    @name == other.name && @surname == other.surname && @date_of_birth == other.date_of_birth
  end

  def self.add_student(new_student)
    unique = true
    @@students.each { |student|

      if student.eql? new_student

        unique = false
        break
      end

    }

    if unique
      @@students << new_student
    end
  end
  def self.students
    @@students
  end

end

lucy = Student.new("Lucy", "Evans", Date.new(2000, 3, 14))
lucy1 = Student.new("Lucy", "Evans", Date.new(2000, 3, 14))

Student.add_student(Student.new("Emma", "Evans", Date.new(2010, 3, 14)))

p lucy.eql? lucy1
p Student.students