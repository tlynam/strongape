json.workout_logs @workout_logs do |json, workout_log|
  json.(workout_log, :date, :notes)
  json.exercises_attributes workout_log.exercises do |json, exercise|
    json.(exercise, :workout_log_id, :name)
    json.exercise_sets_attributes exercise.exercise_sets do |json, exercise_set|
      json.(exercise_set, :exercise_id, :weight, :reps, :failedreps)
    end
  end
end

