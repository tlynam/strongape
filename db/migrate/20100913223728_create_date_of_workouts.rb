class CreateDateOfWorkouts < ActiveRecord::Migration
  def self.up
    create_table :date_of_workouts do |t|
      t.datetime :date_of_workouts
    end
  end

  def self.down
    drop_table :date_of_workouts
  end
end
