class DateOfWorkout < ActiveRecord::Base
  has_many :metrics, :dependent => :destroy
  accepts_nested_attributes_for :metrics, :allow_destroy => true

  has_many :exercises, :dependent => :destroy
  accepts_nested_attributes_for :exercises, :allow_destroy => true

  validates_format_of :date, :with => /\d{4}\-\d{2}\-\d{2}/, :message => "Date must be in the format yyyy/mm/dd"
end
