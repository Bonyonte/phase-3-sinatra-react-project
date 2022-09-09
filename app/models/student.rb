class Student < ActiveRecord::Base
    has_many  :lessons
    has_many :teacher, through: :lesson
end