class ProyectosController < ApplicationController
 before_action :user_is_logged, only: [:create, :delete, :edit, :edit_admin]
 before_action :user_is_owner, only: [:edit, :delete]
 before_action :user_is_admin, only: [:edit_admin]
 def create
   @proyecto = Proyecto.new(project_params)
   @proyecto.usuario_id = current_user.id
   if @proyecto.save
     flash[notice_format(1)] = "Project created successfully"
     redirect_to '/mis_proyectos'
   else
     errors=0
     @proyecto.errors.full_messages.each do |msg|
       flash[error_format(++errors)]=msg
     end
     redirect_to '/nuevo_proyecto'
   end
 end

 def edit

   if @proyecto.update(project_params)
     flash[success_format(1)] = "Project updated successfully"
   else
     errors=0
     @proyecto.errors.full_messages.each do |msg|
       flash[error_format(++errors)]=msg
     end

   end
   redirect_to '/mis_proyectos'
 end

 def edit_admin
   @proyecto = Proyecto.find(params[:id])

   if @proyecto.update(project_admin_params)

     if @proyecto.comentario != nil && @proyecto.comentario.length()>0
       @proyecto.update(porRevisar: true);
     end
     flash[success_format(1)] = "Project updated successfully"
   else
     errors=0
     @proyecto.errors.full_messages.each do |msg|
       flash[error_format(++errors)]=msg
     end

   end
   redirect_to '/admin/proyectos'
 end

 def delete
   Comentario.where(proyecto_id: @proyecto.id).delete_all()
   if @proyecto.delete
     flash[success_format(1)] = "Project deleted"
   else
     errors=0
     @proyecto.errors.full_messages.each do |msg|
       flash[error_format(++errors)]=msg
     end
   end

   redirect_to '/mis_proyectos'

 end

 def user_is_logged
     unless logged_in?
       flash[danger_format(1)] = "You must be logged in to be here!!"
       redirect_to root_url
     end
 end

 def user_is_owner
     @proyecto = Proyecto.find_by(id: params[:id])
     unless my_project(@proyecto) || is_admin?
       flash[danger_format(2)] = "No puedes editar proyectos que no son tuyos"
       redirect_to '/mis_proyectos'
     end
 end

 def user_is_admin
     unless is_admin?
       flash[danger_format(3)] = "Necesitas ser administrador para editar aqui"
       redirect_to root_url
     end
 end

 private

   def project_params
     params.require(:proyecto).permit(:nombre, :contactos, :imagen, :descripcion)
   end

   def project_admin_params
     params.require(:proyecto).permit(:nombre, :contactos, :imagen, :descripcion, :comentario,:aprovado)
   end
end
