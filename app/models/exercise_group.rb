class ExerciseGroup < ActiveRecord::Base
  belongs_to :exercise
	attr_accessible :sets, :reps, :weight, :notes
end
