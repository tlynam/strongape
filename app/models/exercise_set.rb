class ExerciseSet < ActiveRecord::Base
  set_primary_key :id
  belongs_to :exercise
	attr_accessible :reps, :weight, :failedreps, :notes, :exercise_id
end
