class DateOfWorkoutsController < ApplicationController
  # GET /date_of_workouts
  # GET /date_of_workouts.xml
  def index
    @date_of_workouts = DateOfWorkout.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @date_of_workouts }
    end
  end

  # GET /date_of_workouts/1
  # GET /date_of_workouts/1.xml
  def show
    @date_of_workout = DateOfWorkout.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @date_of_workout }
    end
  end

  # GET /date_of_workouts/new
  # GET /date_of_workouts/new.xml
  def new
    @date_of_workout = DateOfWorkout.new :date => Time.now.strftime("%B %e %Y")
    exercise = @date_of_workout.exercises.build
    exercise.exercise_groups.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @date_of_workout }
    end
  end

  # GET /date_of_workouts/1/edit
  def edit
    @date_of_workout = DateOfWorkout.find(params[:id])
  end

  # POST /date_of_workouts
  # POST /date_of_workouts.xml
  def create
    @date_of_workout = DateOfWorkout.new(params[:date_of_workout])

    respond_to do |format|
      if @date_of_workout.save
        format.html { redirect_to(@date_of_workout => 'index', :notice => 'Date of workout was successfully created.') }
        format.xml  { render :xml => @date_of_workout, :status => :created, :location => @date_of_workout }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @date_of_workout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /date_of_workouts/1
  # PUT /date_of_workouts/1.xml
  def update
    @date_of_workout = DateOfWorkout.find(params[:id])

    respond_to do |format|
      if @date_of_workout.update_attributes(params[:date_of_workout])
        format.html { redirect_to(@date_of_workout => "index", :notice => 'Date of workout was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @date_of_workout.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /date_of_workouts/1
  # DELETE /date_of_workouts/1.xml
  def destroy
    @date_of_workout = DateOfWorkout.find(params[:id])
    @date_of_workout.destroy

    respond_to do |format|
      format.html { redirect_to(date_of_workouts_url) }
      format.xml  { head :ok }
    end
  end
end
