class CreateDateOfWorkouts < ActiveRecord::Migration
  def self.up
    create_table :date_of_workouts do |t|
      t.datetime :date
    end
  end

  def self.down
    drop_table :date
  end
end
