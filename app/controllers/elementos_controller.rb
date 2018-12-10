class ElementosController < ApplicationController
  before_action :user_is_admin

  def create
    @elemento = Elemento.new(elemento_params)
    if @elemento.save
      flash[notice_format(1)] = "El elemento ha sido agregado"
    else
      errors=0
      @elemento.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
    end

    redirect_back(fallback_location: '/admin/tendencias')
  end

  def edit

    if !(@elemento = Elemento.find_by(id: params[:id]))
      flash[error_format(1)] = "El elemento no fue encontrado"
    elsif @elemento.update(elemento_params)
      flash[success_format(1)] = "El elemento fue actualizado"
    else
      errors=0
      @elemento.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end

    end

    redirect_back(fallback_location: '/admin/tendencias')
  end


  def delete
    if !(@elemento = Elemento.find_by(id: params[:id]))
      flash[error_format(1)] = "El elemento no fue encontrado"
    elsif @elemento.delete
      flash[success_format(1)] = "Elemento eliminado"
    else
      errors=0
      @elemento.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
    end


    redirect_back(fallback_location: '/admin/tendencias')

  end

  def user_is_admin
      unless logged_in? && is_admin?
        flash[danger_format(3)] = "Necesitas ser administrador para cambiar elementos"
        redirect_to root_url
      end
  end

  private

    def elemento_params
      params.require(:elemento).permit(:nombre, :link, :foto, :descripcion, :tendencia_id)
    end
end
