class UsuariosController < ApplicationController

  before_action :user_is_admin, only: [:edit, :delete]
 def create
   @user = Usuario.new(user_params)
   if @user.save
      flash[success_format(1)] = "User created"
     redirect_to '/admin/proyectos'
   else
     errors=0
     @user.errors.full_messages.each do |msg|
       flash[error_format(++errors)]=msg
     end
     redirect_to '/sesions/crear_usuarios'
   end
   log_in(@user)
 end

 def edit
    @user = Usuario.find(params[:id])
    if @user.update(user_params)
       flash[success_format(1)] = "User updated"
      redirect_to '/account'
    else
      errors=0
      @user.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
      redirect_to '/account'
    end

 end

 def delete
   Usuario.find(params[:id]).destroy
   flash[success_format(1)] = "User deleted"
   redirect_to '/admin/users'

 end

 def user_is_admin
     unless logged_in? && is_admin?
       flash[danger_format(1)] = "You must be admin to be here!!"
       redirect_to root_url
     end
 end

 private

   def user_params
     params.require(:usuario).permit(:name, :email, :admin, :password,
                                  :password_confirmation)
   end
end
