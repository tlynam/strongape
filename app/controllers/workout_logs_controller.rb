
class WorkoutLogsController < ApplicationController
  # GET /workout_logs
  # GET /workout_logs.json
  def index
    @workout_logs = WorkoutLog.order(:date)


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @workout_logs }
    end
  end

  def showall
    @workout_logs = WorkoutLog.order(:date)
  end

  def showcharts
    @workout_logs = WorkoutLog.order(:date)
    @maximum_ruby_hash = Hash.new()
    @maximum_ruby_array = Array.new()
    @total_force_ruby_hash = Hash.new()

    @exercises = Exercise.find_all_by_workout_log_id(
        @workout_logs.each do |workout|
          workout.id
        end
    )
    @exercise_names = @exercises
    @exercise_names = @exercise_names.uniq{|x| x.name}
    @exercise_names.sort!{|a,b| a.name <=> b.name}
    @exercise_names.each do |exercise_name|
      @exercises.each do |exercise|
        max_temp = exercise.name + " Maximum"
        @maximum_ruby_hash[max_temp] = Hash.new()
        @maximum_ruby_hash[max_temp].store("label", max_temp)
        @maximum_ruby_hash[max_temp].store("data", Array.new())

        total_force_temp = exercise.name + " Volume"
        @total_force_ruby_hash[total_force_temp] = Hash.new()
        @total_force_ruby_hash[total_force_temp].store("label", total_force_temp)
        @total_force_ruby_hash[total_force_temp].store("yaxis", 2)
        @total_force_ruby_hash[total_force_temp].store("data", Array.new())
      end
    end
    @exercise_names.each do |exercise_name|
      @exercises.each do |exercise|
        max_temp = exercise.name + " Maximum"
        max_temp2 = exercise_name.name + " Maximum"
        if max_temp === max_temp2 then
          @maximum_ruby_hash[max_temp].fetch("data").push([(WorkoutLog.find_by_id(exercise.workout_log_id)).date.strftime('%s').to_f*1000,ExerciseSet.where(:exercise_id => exercise.id).maximum('weight')])
          #@maximum_ruby_hash[max_temp].fetch("data").push([(WorkoutLog.find_by_id(exercise.workout_log_id)).date,ExrciseSet.where(:exercise_id => exercise.id).maximum('weight')])
          end
      end
    end
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
      format.html { redirect_to workout_logs_url }
      format.json { head :no_content }
    end
  end
end
