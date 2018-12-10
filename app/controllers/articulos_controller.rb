class ArticulosController < ApplicationController
  before_action :user_is_admin

  def create
    @articulo = Articulo.new(articulo_params)
    if @articulo.save
      flash[notice_format(1)] = "El gadget ha sido agregado"
    else
      errors=0
      @articulo.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
    end

    redirect_to '/admin/gadgets'
  end

  def edit

    if !(@articulo = Articulo.find_by(id: params[:id]))
      flash[error_format(1)] = "El gadget no fue encontrado"
    else
      if @articulo.update(articulo_params)
      flash[success_format(1)] = "El gadget fue actualizado"
      else
        errors=0
        @articulo.errors.full_messages.each do |msg|
          flash[error_format(++errors)]=msg
        end
      end

    end

    redirect_to '/admin/gadgets'
  end


  def delete
    if !(@articulo = Articulo.find_by(id: params[:id]))
      flash[error_format(1)] = "El gadget no fue encontrado"
    elsif @articulo.delete
      flash[success_format(1)] = "Gadget eliminado"
    else
      errors=0
      @articulo.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
    end


    redirect_to '/admin/gadgets'

  end

  def user_is_admin
      unless logged_in? && is_admin?
        flash[danger_format(3)] = "Necesitas ser administrador para cambiar elementos"
        redirect_to root_url
      end
  end

  private

    def articulo_params
      params.require(:articulo).permit(:nombre, :propietario, :imagen, :descripcion, :precio, :rentado)
    end
end
