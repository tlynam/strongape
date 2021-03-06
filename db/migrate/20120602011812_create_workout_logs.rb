class CreateWorkoutLogs < ActiveRecord::Migration
  def change
    create_table :workout_logs, {:primary_key => :id} do |t|
			t.integer :id
      t.date :date
      t.text :notes
      t.timestamps
    end

    create_table :exercises, {:primary_key => :id} do |t|
			t.integer :id	
			t.integer :workout_log_id      
			t.string :name
    end

    create_table :exercise_sets, {:primary_key => :id} do |t|
			t.integer :id
			t.integer :exercise_id      
			t.integer :reps
			t.integer :weight
      t.text :notes
    end
  end
end
