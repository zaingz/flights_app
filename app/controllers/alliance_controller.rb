class AllianceController < ApplicationController
  before_filter :authorize
  before_action :set_alliance, only: [:edit, :update, :destroy]

  require 'FileUtils'

  def index
    @alliance = Alliance.all.sort
  end

  def new
    @alliance = Alliance.new
  end

  def edit
  end

  def create
    @alliance = Alliance.new(alliance_params)
    respond_to do |format|
      upload_picture
      @alliance.logo_alliance = @uploaded_io.try(:original_filename)|| " "
      if @alliance.save
        flash[:notice]='Alliance has been created'
        format.html { redirect_to :action => 'index' }
      else
        flash[:alert]= 'Error'
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      path =  Rails.root.join('public', 'images/alliance',  @alliance.logo_alliance||" ")
      if !@uploaded_io.try(:original_filename)
        delete_picture path if  File.exist?(path)
      end
      upload_picture
      @alliance.logo_alliance =  @uploaded_io.try(:original_filename)|| @alliance.logo_alliance
      if @alliance.update(alliance_params)
        flash[:notice]='Alliance has been updated'
        format.html { redirect_to :action => 'index' }
      else
        flash[:alert]= 'Error'
        format.html { render :edit }
      end
    end
  end

  def destroy
    delete_picture Rails.root.join('public', 'images/alliance', @alliance.logo_alliance) if @alliance.logo_alliance
    @alliance.destroy
    respond_to do |format|
      flash[:notice]='Alliance has been deleted'
      format.html {  redirect_to :action => 'index' }
    end
  end

  private

  def set_alliance
    @i=0
    @alliance = Alliance.all.sort.map { |row | row if (@i+=1)==params[:index].to_i}.compact.first

  end

  def alliance_params
    params.require(:alliance).permit(:alliance, :airline, :logo_alliance, :picture)
  end

  def upload_picture
    @uploaded_io = alliance_params[:picture]
    if @uploaded_io
      File.open(Rails.root.join('public', 'images/alliance', @uploaded_io.original_filename), 'wb') do |file|
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
