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

  def calculate_age
    today = Date.today

    age = today.year - @date_of_birth.year
    if today < @date_of_birth.next_year(age)
      age -= 1
    end
    age
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

  def self.remove_student(student)
    @@students.delete(student)
  end

  def self.get_students_by_age(age)
    result = []

    @@students.each do |student|

      if student.calculate_age == age
        result << student
      end

    end

    result
  end

  def self.get_student_by_name(name)
    result = []

    @@students.each do |student|

      if student.name == name
        result << student
      end

    end

    result
  end

  def to_s
    "#{@name} #{@surname}, #{@date_of_birth}"
  end

  def self.students
    @@students
  end

end
