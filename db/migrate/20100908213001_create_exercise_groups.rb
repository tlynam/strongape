class CreateExerciseGroups < ActiveRecord::Migration
  def self.up
    create_table :exercise_groups do |t|
      t.integer :exercise_id
      t.integer :weight
      t.integer :percentage_of_max
      t.integer :sets
      t.integer :reps
      t.string  :description
    end
  end

  def self.down
    drop_table :exercise_groups
  end
end
