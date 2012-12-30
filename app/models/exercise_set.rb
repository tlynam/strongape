class ExerciseSet < ActiveRecord::Base
  set_primary_key :id
  belongs_to :exercise
	attr_accessible :reps, :weight, :failedreps, :notes, :exercise_id
  validates :weight, :numericality => { :greater_than_or_equal_to => 0, :only_float => true }
  validates :reps, :failedreps, :numericality => { :greater_than_or_equal_to => 0, :only_integer => true }
end
