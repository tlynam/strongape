class CreateAthleticPrograms < ActiveRecord::Migration
  def self.up
    create_table :athletic_programs do |t|
      t.string :program_name
    end
  end

  def self.down
    drop_table :athletic_programs
  end
end
