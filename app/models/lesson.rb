class Lesson < ActiveRecord::Base
    has_many :teachers
    belongs_to :student
end