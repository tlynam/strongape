class AthleticProgram < ActiveRecord::Base
  has_many :workouts, :dependent => :destroy
  accepts_nested_attributes_for :workouts, :allow_destroy => true
end
