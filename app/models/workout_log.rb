class WorkoutLog < ActiveRecord::Base
  set_primary_key :id
  attr_accessible :date, :notes, :exercises_attributes, :workout_log_id, :exercise_id, :name, :exercises, :exercise_attributes, :workout_logs_attributes, :workout_log_attributes
	has_many :exercises, :dependent => :destroy, :foreign_key => "workout_log_id"
	accepts_nested_attributes_for :exercises, :allow_destroy => true
end
