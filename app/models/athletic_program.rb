class AthleticProgram < ActiveRecord::Base
  has_many :days_of_weeks, :dependent => :destroy
  accepts_nested_attributes_for :days_of_weeks, :allow_destroy => true
end
