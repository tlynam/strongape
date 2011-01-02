class Metrics < ActiveRecord::Migration
  def self.up
    create_table :metrics do |t|
      t.integer :value
      t.string :unit
    end
  end

  def self.down
    drop_table :metrics
  end
end
