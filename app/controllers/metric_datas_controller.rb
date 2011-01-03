class MetricDatasController < ApplicationController
  # GET /metric_datas
  # GET /metric_datas.xml
  def index
    @metric_datas = MetricData.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @metric_datas }
    end
  end

  # GET /metric_datas/1
  # GET /metric_datas/1.xml
  def show
    @metric_data = MetricData.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @metric_data }
    end
  end

  # GET /metric_datas/new
  # GET /metric_datas/new.xml
  def new
    @metric_data = MetricData.new
    @metrics = Metric.all

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @metric_data }
    end
  end

  # GET /metric_datas/1/edit
  def edit
    @metric_data = MetricData.find(params[:id])
  end

  # POST /metric_datas
  # POST /metric_datas.xml
  def create
    @metric_data = MetricData.new(params[:metric_data])

    

    respond_to do |format|
      if @metric_data.save
        format.html { redirect_to(@metric_data, :notice => 'Metric data was successfully created.') }
        format.xml  { render :xml => @metric_data, :status => :created, :location => @metric_data }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @metric_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /metric_datas/1
  # PUT /metric_datas/1.xml
  def update
    @metric_data = MetricData.find(params[:id])

    respond_to do |format|
      if @metric_data.update_attributes(params[:metric_data])
        format.html { redirect_to(@metric_data, :notice => 'Metric data was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @metric_data.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /metric_datas/1
  # DELETE /metric_datas/1.xml
  def destroy
    @metric_data = MetricData.find(params[:id])
    @metric_data.destroy

    respond_to do |format|
      format.html { redirect_to(metric_datas_url) }
      format.xml  { head :ok }
    end
  end
end
