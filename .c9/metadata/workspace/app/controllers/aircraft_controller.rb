{"changed":true,"filter":false,"title":"aircraft_controller.rb","tooltip":"/app/controllers/aircraft_controller.rb","value":"class AircraftController < ApplicationController\n  before_filter :authorize\n  before_action :set_aircraft, only: [:edit, :update, :destroy]\n\n  require 'fileutils'\n\n  def index\n    @aircraft = Aircraft.all.sort\n  end\n\n\n  def new\n    @aircraft = Aircraft.new\n  end\n\n  def edit\n  end\n\n  def create\n    @aircraft = Aircraft.new(aircraft_params)\n    respond_to do |format|\n      upload_picture\n      @aircraft.aircraft_logo = @uploaded_io.try(:original_filename)|| \" \"\n      if @aircraft.save\n        flash[:notice]='Aircraft has been created'\n        format.html { redirect_to :action => 'index' }\n      else\n        flash[:alert]= 'Error'\n        format.html { render :new }\n      end\n    end\n  end\n\n  def update\n    respond_to do |format|\n        path =  Rails.root.join('public', 'images/aircraft',  @aircraft.aircraft_logo||\" \")\n        if !@uploaded_io.try(:original_filename)\n          delete_picture path if  File.exist?(path)\n        end\n        upload_picture\n        @aircraft.aircraft_logo =  @uploaded_io.try(:original_filename)|| @aircraft.aircraft_logo\n        if @aircraft.update(aircraft_params)\n          flash[:notice]='Aircraft has been updated'\n          format.html { redirect_to :action => 'index' }\n        else\n        flash[:alert]= 'Error'\n        format.html { render :edit }\n        end\n      end\n  end\n\n  def destroy\n    delete_picture Rails.root.join('public', 'images/aircraft',  @aircraft.aircraft_logo) if  @aircraft.aircraft_logo\n    @aircraft.destroy\n    respond_to do |format|\n      flash[:notice]='Aircraft has been deleted'\n      format.html {  redirect_to :action => 'index' }\n\n    end\n  end\n\n  private\n\n  def set_aircraft\n    @i=0\n    @aircraft = Aircraft.all.sort.map { |row | row if (@i+=1)==params[:index].to_i}.compact.first\n\n  end\n\n  def aircraft_params\n    params.require(:aircraft).permit(:airline, :aircraft, :seat, :picture, :aircraft_logo)\n  end\n\n  def upload_picture\n    @uploaded_io = aircraft_params[:picture]\n    if @uploaded_io\n      File.open(Rails.root.join('public', 'images/aircraft', @uploaded_io.original_filename), 'wb') do |file|\n        file.write(@uploaded_io.read)\n      end\n\n    end\n  end\n\n  def delete_picture fname\n    if  File.exist?(fname)\n        FileUtils.rm(fname)\n     end\n\n  end\n\nend\n","undoManager":{"mark":-1,"position":0,"stack":[[{"group":"doc","deltas":[{"start":{"row":4,"column":11},"end":{"row":4,"column":20},"action":"remove","lines":["FileUtils"]},{"start":{"row":4,"column":11},"end":{"row":4,"column":20},"action":"insert","lines":["fileutils"]}]}]]},"ace":{"folds":[],"scrolltop":0,"scrollleft":0,"selection":{"start":{"row":4,"column":20},"end":{"row":4,"column":20},"isBackwards":false},"options":{"guessTabSize":true,"useWrapMode":false,"wrapToView":true},"firstLineState":0},"timestamp":1428600950000}