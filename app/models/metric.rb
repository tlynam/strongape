class Metric < ActiveRecord::Base
  has_many :metric_datas
  accepts_nested_attributes_for :metric_datas, :allow_destroy => true
end
