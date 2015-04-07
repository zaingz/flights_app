class AircraftController < ApplicationController
  before_filter :authorize
  before_action :set_aircraft, only: [:edit, :update, :destroy]

  require 'FileUtils'

  def index
    @aircraft = Aircraft.all.sort
  end


  def new
    @aircraft = Aircraft.new
  end

  def edit
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)
    respond_to do |format|
      upload_picture
      @aircraft.aircraft_logo = @uploaded_io.try(:original_filename)|| " "
      if @aircraft.save
        flash[:notice]='Aircraft has been created'
        format.html { redirect_to :action => 'index' }
      else
        flash[:alert]= 'Error'
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
        path =  Rails.root.join('public', 'images/aircraft',  @aircraft.aircraft_logo||" ")
        if !@uploaded_io.try(:original_filename)
          delete_picture path if  File.exist?(path)
        end
        upload_picture
        @aircraft.aircraft_logo =  @uploaded_io.try(:original_filename)|| @aircraft.aircraft_logo
        if @aircraft.update(aircraft_params)
          flash[:notice]='Aircraft has been updated'
          format.html { redirect_to :action => 'index' }
        else
        flash[:alert]= 'Error'
        format.html { render :edit }
        end
      end
  end

  def destroy
    delete_picture Rails.root.join('public', 'images/aircraft',  @aircraft.aircraft_logo) if  @aircraft.aircraft_logo
    @aircraft.destroy
    respond_to do |format|
      flash[:notice]='Aircraft has been deleted'
      format.html {  redirect_to :action => 'index' }

    end
  end

  private

  def set_aircraft
    @i=0
    @aircraft = Aircraft.all.sort.map { |row | row if (@i+=1)==params[:index].to_i}.compact.first

  end

  def aircraft_params
    params.require(:aircraft).permit(:airline, :aircraft, :seat, :picture, :aircraft_logo)
  end

  def upload_picture
    @uploaded_io = aircraft_params[:picture]
    if @uploaded_io
      File.open(Rails.root.join('public', 'images/aircraft', @uploaded_io.original_filename), 'wb') do |file|
        file.write(@uploaded_io.read)
      end

    end
  end

  def delete_picture fname
    if  File.exist?(fname)
        FileUtils.rm(fname)
     end

  end

end
