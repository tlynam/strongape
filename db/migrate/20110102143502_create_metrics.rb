class CreateMetrics < ActiveRecord::Migration
  def self.up
    create_table :metrics do |t|
      t.string :name
      t.string :unit
    end
  end

  def self.down
    drop_table :metrics
  end
end
