# frozen_string_literal: true

class Student
  @@all = []
  attr_reader :name
  attr_reader :surname
  attr_reader :date_of_birth

  def initialize(name, surname, date_of_birth)
    @name = name
    @surname = surname
    @date_of_birth = date_of_birth
    @@all << self
  end
end
