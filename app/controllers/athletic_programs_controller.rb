class AthleticProgramsController < ApplicationController
  # GET /athletic_programs
  # GET /athletic_programs.xml
  def index
    @athletic_programs = AthleticProgram.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @athletic_programs }
    end
  end

  # GET /athletic_programs/1
  # GET /athletic_programs/1.xml
  def show
    @athletic_program = AthleticProgram.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @athletic_program }
    end
  end

  # GET /athletic_programs/new
  # GET /athletic_programs/new.xml
  def new
    @athletic_program = AthleticProgram.new
    #days_of_week = @athletic_program.days_of_weeks.build
    #exercise = days_of_week.exercises.build
    #exercise.exercise_groups.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @athletic_program }
    end
  end

  # GET /athletic_programs/1/edit
  def edit
    @athletic_program = AthleticProgram.find(params[:id])
  end

  # POST /athletic_programs
  # POST /athletic_programs.xml
  def create
    @athletic_program = AthleticProgram.new(params[:athletic_program])

    respond_to do |format|
      if @athletic_program.save
        format.html { redirect_to(@athletic_program => "index", :notice => 'Athletic program was successfully created.') }
        format.xml  { render :xml => @athletic_program, :status => :created, :location => @athletic_program }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @athletic_program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /athletic_programs/1
  # PUT /athletic_programs/1.xml
  def update
    @athletic_program = AthleticProgram.find(params[:id])

    respond_to do |format|
      if @athletic_program.update_attributes(params[:athletic_program])
        format.html { redirect_to(@athletic_program => "index", :notice => 'Athletic program was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @athletic_program.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /athletic_programs/1
  # DELETE /athletic_programs/1.xml
  def destroy
    @athletic_program = AthleticProgram.find(params[:id])
    @athletic_program.destroy

    respond_to do |format|
      format.html { redirect_to(athletic_programs_url) }
      format.xml  { head :ok }
    end
  end
end
