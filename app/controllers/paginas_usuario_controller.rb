class PaginasUsuarioController < ApplicationController
  before_action :user_is_logged

  def ver_proyectos
    @proyectos = Proyecto.where(usuario_id: current_user.id).order(porRevisar: :desc, created_at: :desc)
  end

  def editar_proyecto

    if (params[:name]!=nil && @proyecto = Proyecto.find_by(nombre: params[:name]))
      @proyecto.update(porRevisar: false)
      @comentarios = Comentario.where(proyecto_id: @proyecto.id).order(created_at: :desc)
    else
      flash[error_format(1)] = "That project doesn't exist"
      redirect_to '/mis_proyectos'
    end
  end

  def agregar_proyecto
  end

  def my_account
  end

  def user_is_logged
      unless logged_in?
        flash[danger_format(1)] = "You must be logged in to be here!!"
        redirect_to root_url
      end
  end
end
