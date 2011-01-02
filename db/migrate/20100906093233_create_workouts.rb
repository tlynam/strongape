class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|
      t.integer :athletic_program_id
      t.datetime :workout_time
      t.string :day
    end
  end

  def self.down
    drop_table :workouts
  end
end
