class CreateDateOfWorkouts < ActiveRecord::Migration
  def self.up
    create_table :date_of_workouts do |t|
      t.datetime :date
      t.text :description
    end
  end

  def self.down
    drop_table :date
  end
end
