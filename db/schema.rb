# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110101132126) do

  create_table "athletic_programs", :force => true do |t|
    t.string "name"
    t.text   "description"
  end

  create_table "date_of_workouts", :force => true do |t|
    t.datetime "date"
    t.text     "description"
  end

  create_table "days_of_weeks", :force => true do |t|
    t.boolean "sunday"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
  end

  create_table "exercise_groups", :force => true do |t|
    t.integer "exercise_id"
    t.integer "weight"
    t.integer "percentage_of_max"
    t.integer "sets"
    t.integer "reps"
    t.string  "description"
  end

  create_table "exercises", :force => true do |t|
    t.integer "workout_id"
    t.integer "date_of_workout_id"
    t.string  "name"
  end

  create_table "workouts", :force => true do |t|
    t.integer  "program_week_id"
    t.integer  "athletic_program_id"
    t.datetime "workout_time"
    t.string   "day"
  end

end
