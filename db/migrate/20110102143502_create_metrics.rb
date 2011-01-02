class CreateMetrics < ActiveRecord::Migration
  def self.up
    create_table :metrics do |t|
      t.string :name
      t.integer :value
      t.string :unit
      t.datetime :date
    end
  end

  def self.down
    drop_table :metrics
  end
end
