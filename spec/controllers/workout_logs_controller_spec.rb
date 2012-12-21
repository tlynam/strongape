  require 'spec_helper'

describe WorkoutLogsController do
  render_views  

  def valid_attributes
    {:notes => "notes",
     :date => "2012-03-03"}
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WorkoutLogsController. Be sure to keep this updated too.

  describe "GET index" do
    it "assigns all workout_logs as @workout_logs" do      
      workout_log = WorkoutLog.create! valid_attributes      
      get :index
      response.should render_template("index")
      assigns(:workout_logs).should eq([workout_log])      
    end
  end

  describe "GET show" do
    it "assigns the requested workout_log as @workout" do
      workout = WorkoutLog.create! valid_attributes
      get :show, {:id => workout.id}
      response.should render_template("show")
      assigns(:workout_log).should eq(workout)
    end
  end

  describe "GET new" do
    it "assigns a new workout_log as @workout_log" do
      get :new
      assigns(:workout_log).should be_a_new(WorkoutLog)
    end
  end

  describe "GET edit" do
    it "assigns the requested workout_log as @workout_log" do
      workout_log = WorkoutLog.create! valid_attributes
      get :edit, {:id => workout_log.to_param}
      assigns(:workout_log).should eq(workout_log)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new workout_log" do
        expect {
          post :create, {:workout_log => valid_attributes}
        }.to change(WorkoutLog, :count).by(1)
      end

      it "assigns a newly created workout_log as @workout_log" do
        post :create, {:workout_log => valid_attributes}
        assigns(:workout_log).should be_a(WorkoutLog)        
      end

      it "redirects to the created workout_log" do
        post :create, {:workout_log => valid_attributes}
        response.should redirect_to(WorkoutLog.last)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template and not creates a new workout_log" do
        # Trigger the behavior that occurs when invalid params are submitted
        WorkoutLog.any_instance.stub(:save).and_return(false)
        expect {
          post :create, {:workout_log => {}}
        }.to change(WorkoutLog, :count).by(0)        
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "redirects to the workout_log" do
        workout_log = WorkoutLog.create! valid_attributes
        put :update, {:id => workout_log.to_param, :workout_log => valid_attributes}
        response.should redirect_to(workout_log)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'edit' template" do
        workout_log = WorkoutLog.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WorkoutLog.any_instance.stub(:save).and_return(false)
        put :update, {:id => workout_log.to_param, :workout_log => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested workout_log and redirects to the workout_logs list" do
      workout_log = WorkoutLog.create! valid_attributes
      expect {
        delete :destroy, {:id => workout_log.to_param}
      }.to change(WorkoutLog, :count).by(-1)
      response.should redirect_to(workout_logs_url)
    end
  end

  describe "POST from_text" do
    describe "with valid params" do
      it "creates a new workout from params[:text]" do
        expect {
          JsonSpec.directory = Rails.root.join('spec','support')
          post :from_text, {:text => load_json("correct_json.json")}
          flash[:notice].should eq("You successfully added data.")
        }.to change(WorkoutLog, :count).by(1)
      end

      it "creates a new workout from params[:text]" do
        expect {
          JsonSpec.directory = Rails.root.join('spec','support')
          post :from_text, {:text => load_json("incorrect_workout.json")}
        }.to change(WorkoutLog, :count).by(0)
      end

      it "creates 4 new exercises from params[:text]" do
        expect {
          JsonSpec.directory = Rails.root.join('spec','support')
          post :from_text, {:text => load_json("correct_json.json")}
        }.to change(Exercise, :count).by(4)
      end

      it "creates 17 new exercise_sets from params[:text]" do
        expect {
          JsonSpec.directory = Rails.root.join('spec','support')
          post :from_text, {:text => load_json("correct_json.json")}
        }.to change(ExerciseSet, :count).by(17)
      end

      it "assigns a newly created workout as @workout from params[:text]" do
        JsonSpec.directory = Rails.root.join('spec','support')
        post :from_text, {:text => load_json("correct_json.json")}
        assigns(:workout).should be_a(WorkoutLog)
      end

      it "redirects to the list of workout_logs from params[:text]" do
        JsonSpec.directory = Rails.root.join('spec','support')
        post :from_text, {:text => load_json("correct_json.json")}
        response.should redirect_to(workout_logs_url)
      end
    end
  end
end
