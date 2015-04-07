class SessionController < ApplicationController
  def new
  end

  def create
    admin = Admin.find_by_name(params[:login_path][:name])

    if admin && admin.authenticate(params[:login_path][:password])
      session[:admin_id] = admin.id
      flash[:notice] = "You have been successfully loged in"
      redirect_to :dashboard_path
    else
      flash[:alert] = "Username or Password doesn't match"
      redirect_to :login_path
    end
  end

  def destroy
    session[:admin_id] = nil
    flash[:notice] = "You have been successfully loged out"
    redirect_to root_path
  end
end
