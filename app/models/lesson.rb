class Lesson < ActiveRecord::Base
    has_many :teachers
    belongs_to :students 
end