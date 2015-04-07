class AirlineController < ApplicationController
  before_filter :authorize
  before_action :set_airline, only: [:edit, :update, :destroy]

  require 'FileUtils'

  def index
    @airline = Airline.all.sort
  end

  def new
    @airline = Airline.new
  end

  def edit
  end

  def create
    @airline = Airline.new(airline_params)
    respond_to do |format|
      upload_picture
      @airline.airline_logo = @uploaded_io.try(:original_filename)|| " "
      if @airline.save
        flash[:notice]='Airline has been created'
        format.html { redirect_to :action => 'index' }
      else
        flash[:alert]= 'Error'
        format.html { render :new }
      end
    end
  end
#TODO: change images path in this and aircraft
  def update
    respond_to do |format|
      path =  Rails.root.join('public', 'images/airline',  @airline.airline_logo||" ")
      if !@uploaded_io.try(:original_filename)
        delete_picture path if  File.exist?(path)
      end
      upload_picture
      @airline.airline_logo =  @uploaded_io.try(:original_filename)|| @airline.airline_logo
      if @airline.update(airline_params)
        flash[:notice]='Airline has been updated'
        format.html { redirect_to :action => 'index' }
      else
        flash[:alert]= 'Error'
        format.html { render :edit }
      end
    end
  end

  def destroy
    delete_picture Rails.root.join('public', 'images/airline',  @airline.airline_logo) if  @airline.airline_logo
    @airline.destroy
    respond_to do |format|
      flash[:notice]='Airline has been deleted'
      format.html {  redirect_to :action => 'index' }

    end
  end

  private

  def set_airline
    @i=0
    @airline = Airline.all.sort.map { |row | row if (@i+=1)==params[:index].to_i}.compact.first

  end

  def airline_params
    params.require(:airline).permit(:airline, :picture, :airline_logo)
  end

  def upload_picture
    @uploaded_io = airline_params[:picture]
    if @uploaded_io
      File.open(Rails.root.join('public', 'images/airline', @uploaded_io.original_filename), 'wb') do |file|
        file.write(@uploaded_io.read)
      end

    end
  end

  def delete_picture fname
    if  File.exist?(fname)
      FileUtils.rm(fname)
    end

  end


  #end of class
end
