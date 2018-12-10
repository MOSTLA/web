class TendenciasController < ApplicationController

  before_action :user_is_admin

  def create
    @tendencia = Tendencia.new(tendencia_params)
    if @tendencia.save
      flash[notice_format(1)] = "La tendencia ha sido agregada"
      redirect_to '/admin/tendencias'
    else
      errors=0
      @tendencia.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
      redirect_to '/admin/tendencias'
    end
  end

  def edit

    if !(@tendencia = Tendencia.find_by(id: params[:id]))
      flash[error_format(1)] = "la tendencia no fue encontrada"
    elsif @tendencia.update(tendencia_params)
      flash[success_format(1)] = "La tendencia fue actualizada"
    else
      errors=0
      @tendencia.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end

    end
    redirect_to '/admin/tendencias'
  end


  def delete
    if !(@tendencia = Tendencia.find_by(id: params[:id]))
      flash[error_format(1)] = "la tendencia no fue encontrada"
    else
      Elemento.where(tendencia_id: @tendencia.id).delete_all()
      if @tendencia.delete
        flash[success_format(1)] = "Tendencia eliminada"
      else
        errors=0
        @tendencia.errors.full_messages.each do |msg|
          flash[error_format(++errors)]=msg
        end
      end
    end

    redirect_to '/admin/tendencias'

  end

  def user_is_admin
      unless logged_in? && is_admin?
        flash[danger_format(3)] = "Necesitas ser administrador para cambiar tendencias"
        redirect_to root_url
      end
  end

  private

    def tendencia_params
      params.require(:tendencia).permit(:nombre, :abreviacion, :imagen)
    end
end
