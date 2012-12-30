
class WorkoutLogsController < ApplicationController
  # GET /workout_logs
  # GET /workout_logs.json
  def index
    @workout_logs = WorkoutLog.order("date desc").page(params[:page])


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workout_logs }
    end
  end

  def showall
    @workout_logs = WorkoutLog.order(:date)
  end

  def showcharts
    @maximum_ruby_hash = Hash.new()
    @exercises = Exercise.all
    @exercises.each do |exercise|
      #Filters exercises that don't have 4 or more days of data
      @workout_logs = WorkoutLog.joins(:exercises).where(:exercises => {:name => exercise.name})
      if @workout_logs.count > 4 then
        @exercise_sets = ExerciseSet.find_all_by_exercise_id(exercise.id)
        @exercise_sets.each do |exercise_set|
          if exercise_set.weight.to_i > 0 && exercise_set.reps > 0 && exercise.name != "" then
            @max_label = exercise.name + " Maximum"
            if @maximum_ruby_hash[@max_label] == nil then
              @maximum_ruby_hash[@max_label] = Hash.new()
              @maximum_ruby_hash[@max_label].store("label", @max_label)
              @maximum_ruby_hash[@max_label].store("data", Array.new())
            end
            #Only adding exercise data where there was weight involved and a completed rep because there's a failed column
            max_push = ExerciseSet.where("exercise_id = ? AND reps > 0 AND weight > 0", exercise.id).maximum('weight')
            date_push = WorkoutLog.find_by_id(exercise.workout_log_id).date.strftime('%s').to_f*1000
            array_push = [date_push,max_push]
            @temp_hash = @maximum_ruby_hash[@max_label]
            @temp_hash.fetch("data").push(array_push) 
            @maximum_ruby_hash.merge(@temp_hash)
          end
        end
      end
    end
    @maximum_ruby_hash = Hash[@maximum_ruby_hash.sort]
  end

  def showallnotes
    @workout_logs = WorkoutLog.order(:date)
  end

  def showallprint
    @workout_logs = WorkoutLog.order(:date)
  end

  # GET /workout_logs/1
  # GET /workout_logs/1.json
  def show
    @workout_log = WorkoutLog.find(params[:id])
    @exercises = Exercise.find_all_by_workout_log_id(@workout_log.id)
  end

  def from_file
    data_file = params[:file]
    errors = {}
    counter = 0
    if data_file.content_type == 'application/json'
      File.open(Rails.root.join('public', 'uploads', data_file.original_filename), 'w') do |file|
        file.write(data_file.read)
      end
      file_workouts = File.read( 'public/uploads/'+ data_file.original_filename)
      array_workouts = JSON.parse(file_workouts)
      array_workouts.each do |string_workout|
        workout = WorkoutLog.new
        workout.created_at = string_workout["created_at"].to_time
        workout.date = string_workout["date"].to_date
        workout.updated_at = string_workout["updated_at"].to_time
        workout.notes = string_workout["notes"]
        unless workout.save
          errors[counter] = workout.errors.messages
          counter += 1
        end
      end
      if errors.empty?
        flash[:notice] = 'You successfully added data from file.'
        redirect_to workout_logs_path
      else
        flash[:alert] = 'Some mistakes in json file prevented some workouts
         from saving,but rightios ones were kept.'
        redirect_to workout_logs_path
      end
    else
      flash[:notice] = 'The type of document differ from json.'
      redirect_to workout_logs_path
    end
  end

  def from_text
    data_text = params[:text]
    errors = {}
    counter = 0


        new_record = WorkoutLog.new(JSON.parse(data_text))

        unless new_record.save
          errors[counter] = workout.errors.messages
          counter += 1
        end

      if errors.empty?
        flash[:notice] = 'You successfully added data from file.'
        redirect_to workout_logs_path
      else
        flash[:alert] = 'Some mistakes in json file prevented some workouts
         from saving,but right ones were kept.'
        redirect_to workout_logs_path
      end
    end

  # GET /workout_logs/new
  # GET /workout_logs/new.json
  def new
    @workout_log = WorkoutLog.new
    exercise = @workout_log.exercises.build
    exercise.exercise_sets.build
    @workout_log.date = Date.today.strftime('%Y-%m-%d')

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @workout_log }
    end
  end

  # GET /workout_logs/1/edit
  def edit
    @workout_log = WorkoutLog.find(params[:id])
  end

  # POST /workout_logs
  # POST /workout_logs.json
  def create
    @workout_log = WorkoutLog.new(params[:workout_log])

    respond_to do |format|
      if @workout_log.save
        format.html { redirect_to @workout_log, notice: 'Workout log was successfully created.' }
        format.json { render json: @workout_log, status: :created, location: @workout_log }
      else
        format.html { render action: "new" }
        format.json { render json: @workout_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /workout_logs/1
  # PUT /workout_logs/1.json
  def update
    @workout_log = WorkoutLog.find(params[:id])

    respond_to do |format|
      if @workout_log.update_attributes(params[:workout_log])
        format.html { redirect_to @workout_log, notice: 'Workout log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @workout_log.errors, status: :unprocessable_entity }
      end
    end
  end

  def logimport
    
  end

  # DELETE /workout_logs/1
  # DELETE /workout_logs/1.json
  def destroy
    @workout_log = WorkoutLog.find(params[:id])
    @workout_log.destroy

    respond_to do |format|
      format.html { redirect_to workout_logs_url, notice: 'Workout log was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
