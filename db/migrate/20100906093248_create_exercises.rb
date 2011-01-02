class CreateExercises < ActiveRecord::Migration
  def self.up
    create_table :exercises do |t|
      t.integer :days_of_week_id
      t.integer :date_of_workout_id
      t.string :name
    end
  end

  def self.down
    drop_table :exercises
  end
end
