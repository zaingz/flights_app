class RouteController < ApplicationController
  before_filter :authorize
  before_action :set_route, only: [:edit, :update, :destroy]

  def index
    @route = Route.all.sort
  end

  def new
    @route = Route.new
  end

  def edit
  end

  def create
    @route = Route.new(route_params)
    respond_to do |format|
      if @route.save
        flash[:notice]='Route has been created'
        format.html { redirect_to :action => 'index' }
      else
        flash[:alert]= 'Error'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @route.update(route_params)
        flash[:notice]='Route has been updated'
        format.html { redirect_to :action => 'index' }
      else
        flash[:alert]= 'Error'
        format.html { render :edit }
      end
    end
  end

  def destroy
    @route.destroy
    respond_to do |format|
      flash[:notice]='Route has been deleted'
      format.html {  redirect_to :action => 'index' }

    end
  end

  private

  def set_route
    @i=0
    @route = Route.all.sort.map { |row | row if (@i+=1)==params[:index].to_i}.compact.first

  end

  def route_params
    params.require(:route).permit(:airline, :start, :end, :aircraft, :origin,:destination, :zone)
  end


  #end of class
end
