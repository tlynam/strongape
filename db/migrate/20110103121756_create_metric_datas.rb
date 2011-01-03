class CreateMetricDatas < ActiveRecord::Migration
  def self.up
    create_table :metric_datas do |t|
      t.integer :metric_id
      t.integer :value
      t.datetime :date
    end
  end

  def self.down
    drop_table :metric_datas
  end
end
