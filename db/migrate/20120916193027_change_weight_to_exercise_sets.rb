class ChangeWeightToExerciseSets < ActiveRecord::Migration
  def up
    change_column :exercise_sets, :weight, :float
  end

  def down
    change_column :exercise_sets, :weight, :integer
  end
end
