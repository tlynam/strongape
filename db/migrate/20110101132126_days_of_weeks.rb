class DaysOfWeeks < ActiveRecord::Migration
  def self.up
    create_table :days_of_weeks do |t|
      t.integer :athletic_program_id
      t.boolean :sunday
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
    end
  end

  def self.down
    drop table :DaysOfWeeks
  end
end
