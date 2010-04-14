class DivesController < ApplicationController
  def index
    @dives = Dives.all
  end
  
  def show
    @dives = Dives.find(params[:id])
  end
  
  def new
    @dives = Dives.new
  end
  
  def create
    @dives = Dives.new(params[:dives])
    if @dives.save
      flash[:notice] = "Successfully created dives."
      redirect_to @dives
    else
      render :action => 'new'
    end
  end
  
  def edit
    @dives = Dives.find(params[:id])
  end
  
  def update
    @dives = Dives.find(params[:id])
    if @dives.update_attributes(params[:dives])
      flash[:notice] = "Successfully updated dives."
      redirect_to @dives
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @dives = Dives.find(params[:id])
    @dives.destroy
    flash[:notice] = "Successfully destroyed dives."
    redirect_to dives_url
  end
end
