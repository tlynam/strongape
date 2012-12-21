class ChangeExerciseSetsDefautlsAddSets < ActiveRecord::Migration
  def up
    change_column :exercise_sets, :weight, :float, :default => 0
    change_column :exercise_sets, :reps, :integer, :default => 0
    change_column :exercise_sets, :failedreps, :integer, :default => 0
    add_column :exercise_sets, :set, :integer, :default => 0
  end

  def down
    change_column :exercise_sets, :weight, :float
    change_column :reps, :weight, :integer
    change_column :failedreps, :weight, :integer
    remove_column :exercise_sets, :set, :integer, :default => 0
  end
end
