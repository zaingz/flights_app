class MileController < ApplicationController
  before_filter :authorize
  before_action :set_mile, only: [:edit, :update, :destroy]

  def index
    @mile = Mile.all.sort
  end


  def new
    @mile = Mile.new
  end

  def edit
  end

  def create
    @mile = Mile.new(mile_params)
    respond_to do |format|
     if @mile.save
        flash[:notice]='Mile has been created'
        format.html { redirect_to :action => 'index' }
      else
        flash[:alert]= 'Error'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @mile.update(mile_params)
        flash[:notice]='Mile has been updated'
        format.html { redirect_to :action => 'index' }
      else
        flash[:alert]= 'Error'
        format.html { render :edit }
      end
    end
  end

  def destroy
   @mile.destroy
    respond_to do |format|
      flash[:notice]='Mile has been deleted'
      format.html {  redirect_to :action => 'index' }

    end
  end

  private

  def set_mile
    @i=0
    @mile = Mile.all.sort.map { |row | row if (@i+=1)==params[:index].to_i}.compact.first

  end

  def mile_params
    params.require(:mile).permit(:alliance, :zone, :miles, :picture)
  end

#end of class
end
