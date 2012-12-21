class Exercise < ActiveRecord::Base
  set_primary_key :id
  belongs_to :workout_log
  has_many :exercise_sets, :dependent => :destroy, :foreign_key => "exercise_id"
  accepts_nested_attributes_for :exercise_sets, :allow_destroy => true
  attr_accessible :name, :exercise_sets_attributes, :exercise_sets, :workout_log_id, :exercise_id, :exercise_set_attributes
end
