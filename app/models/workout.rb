class Workout < ActiveRecord::Base
  belongs_to :athletic_program
  has_many :exercises, :dependent => :destroy
    accepts_nested_attributes_for :exercises, :allow_destroy => true

  has_many :days_of_weeks, :dependent => :destroy
    accepts_nested_attributes_for :days_of_weeks, :allow_destroy => true
end