class AdminsController < ApplicationController


  def index
    @admin = Admin.all
  end
  def new
    @admin = Admin.new
  end

  def create
    admin = Admin.new(admin_params)
    if admin.save
      session[:admin_id] = admin.id
      flash[:notice] = 'New admin has been created successfully'
      redirect_to :dashboard_path
    else
      flash[:alert]= 'Error occured'
    end
  end


  private
    def admin_params
      params.require(:admin_create_now).permit(:name, :password, :password_confirmation)
    end
end
