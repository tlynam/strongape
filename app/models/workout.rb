class Workout < ActiveRecord::Base
  belongs_to :athletic_program
  has_many :exercises, :dependent => :destroy
  accepts_nested_attributes_for :exercises, :allow_destroy => true
end
