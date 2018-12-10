class ComentariosController < ApplicationController
  before_action :user_is_logged, only: [:delete]
  def create
    @comentario = Comentario.new(comentario_params)
    if @comentario.save
      flash[notice_format(1)] = "Se agregó el comentario"
      redirect_back(fallback_location: '/proyectos')
    else
      errors=0
      @comentario.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
      redirect_back(fallback_location: '/proyectos')
    end
  end


  def delete
    if !(@comentario = Comentario.find_by(id: params[:id]))
      flash[error_format(1)] = "El comentario no fue encontrada"
    elsif @comentario.delete
      flash[success_format(1)] = "Comentario eliminado"
    else
      errors=0
      @comentario.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
    end

    redirect_back(fallback_location: '/proyectos')

  end

  def user_is_logged
      unless logged_in?
        flash[danger_format(1)] = "You must be logged to delete messages"
        redirect_to root_url
      end
  end

  private

    def comentario_params
      params.require(:comentario).permit(:matricula, :comentario, :proyecto_id)
    end
end
