class AddFailedRepsToExerciseSets < ActiveRecord::Migration
  def change
    add_column :exercise_sets, :failedreps, :integer
  end
end
