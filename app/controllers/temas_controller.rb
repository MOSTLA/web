class TemasController < ApplicationController
  before_action :user_is_admin

  def create
    @tema = Tema.new
    @tema.nombre = params[:tema][:nombre]
    if @tema.save
      flash[notice_format(1)] = "El tema ha sido agregado"
      redirect_to '/admin/temas'
    else
      errors=0
      @tema.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
      redirect_to '/admin/temas'
    end
  end

  def edit

    if !(@tema = Tema.find_by(id: params[:id]))
      flash[error_format(1)] = "El tema no fue encontrado"
    elsif @tema.update(nombre: params[:tema][:nombre])
      flash[success_format(1)] = "El tema fue actualizado"
    else
      errors=0
      @tema.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end

    end
    redirect_to '/admin/temas'
  end

  def change
    if !(@tema = Tema.find_by(id: params[:id]))
      flash[error_format(1)] = "El tema no fue encontrado"
    elsif @ppt = Ppt.find_by(id: params[:ppt][:id])
      @imagen = @ppt.imagen
      if params[:ppt][:imagen] != nil
        @imagen = params[:ppt][:imagen]
      end
      if @ppt.update(imagen: @imagen, posicion: params[:ppt][:posicion])
        flash[success_format(1)] = "El tema fue actualizado"
      else
        errors=0
        @ppt.errors.full_messages.each do |msg|
          flash[error_format(++errors)]=msg
        end
      end
    else
      flash[error_format(1)] = "La imagen no fue encontrada"
    end
    redirect_back(fallback_location:'/admin/temas')
  end

  def add_photo
    if !(@tema = Tema.find_by(id: params[:id]))
      flash[error_format(1)] = "El tema no fue encontrado"
    else
      @pos2 = Ppt.where(tema_id: @tema.id).order(posicion: :desc)
      @pos=0
      if @pos2.count>0
        @pos = @pos2.first.posicion + 1
      end

      @ppt = Ppt.create(tema_id: @tema.id,imagen: params[:tema][:imagen], posicion: @pos)
      if @ppt
        flash[success_format(1)] = "El tema fue actualizado"
      else
        errors=0
        @ppt.errors.full_messages.each do |msg|
          flash[error_format(++errors)]=msg
        end
      end
    end
    redirect_back(fallback_location:'/admin/temas')
  end

  def delete_slide
    if !(@slide = Ppt.find_by(id: params[:id]))
      flash[error_format(1)] = "La slide no fue enconrada"
    else
      if @slide.delete
        flash[success_format(1)] = "Slide eliminada"
      else
        errors=0
        @slide.errors.full_messages.each do |msg|
          flash[error_format(++errors)]=msg
        end
      end

    end

    redirect_back(fallback_location: '/admin/temas')
  end

  def delete
    if !(@tema = Tema.find_by(id: params[:id]))
      flash[error_format(1)] = "El tema no fue enconrado"
    else
      Ppt.where(tema_id: @tema.id).destroy_all
      if @tema.delete
        flash[success_format(1)] = "Tema eliminado"
      else
        errors=0
        @tema.errors.full_messages.each do |msg|
          flash[error_format(++errors)]=msg
        end
      end

    end

    redirect_to '/admin/temas'

  end

  def user_is_admin
      unless logged_in? && is_admin?
        flash[danger_format(3)] = "Necesitas ser administrador para cambiar tendencias"
        redirect_to root_url
      end
  end

end
