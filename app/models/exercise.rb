class Exercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :date_of_workout
  has_many :exercise_groups, :dependent => :destroy
  accepts_nested_attributes_for :exercise_groups, :allow_destroy => true
end
