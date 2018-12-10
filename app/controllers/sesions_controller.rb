class SesionsController < ApplicationController
  def admin
  end

  def create
    user = Usuario.find_by(name: params[:sesion][:name])
    if user && user.authenticate(params[:sesion][:password])
      log_in user
      flash[notice_format(13)]="Welcome "+current_user.name
      params[:sesion][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to root_url
    else
      render 'admin'
    end
  end

  def destroy
    log_out if logged_in?

    redirect_back(fallback_location: root_url)
  end
end
