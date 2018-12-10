class PaginasAdminController < ApplicationController
  before_action :user_is_admin , except: [:ver_presentacion]

  def editar_tendencias
    @tendencias = Tendencia.order(created_at: :desc).all
  end

  def editar_elementos
    @tendencia = Tendencia.find_by(id: params[:id])
    if(@tendencia == nil)

      flash[notice_format(1)] = "Esa tendencia no existe"
      redirect_to '/admin/tendencias'
    else
      @elementos = Elemento.where(tendencia_id: params[:id])
    end
  end

  def editar_temas
    @temas = Tema.order(created_at: :desc)
  end

  def editar_presentacion
    @tema = Tema.find_by(id: params[:id])
    if(@tema== nil)
      flash[error_format(1)] = "Ese tema no existe"
      redirect_to '/admin/temas'
    else
      @ppts = Ppt.where(tema_id: @tema.id).order(posicion: :asc)
    end
  end

  def ver_presentacion
    @tema = Tema.find_by(nombre: params[:name])
    if(@tema== nil)
      flash[error_format(1)] = "Ese tema no existe"
      redirect_to '/admin/temas'
    else
      @ppts = Ppt.where(tema_id: @tema.id).order(posicion: :asc)
    end
  end

  def proyectos
    @proyectos = Proyecto.order( aprovado: :asc, porRevisar: :asc, created_at: :desc).all
  end

  def revision_proyecto
    @proyecto = Proyecto.find_by(id: params[:id])
    if(@proyecto == nil)
      flash[notice_format(1)] = "Ese proyecto no existe"
      redirect_to '/admin/proyectos'
    else
      @comentarios = Comentario.where(proyecto_id: @proyecto.id).order(created_at: :desc)

    end
  end

  def pedidos_articulos
    @articulos = Articulo.where(pedido: true).order(fechaPedido: :asc)
  end

  def articulos_rentados
    @articulos = Articulo.where(rentado: true).order(fechaPedido: :desc)
  end

  def editar_productos
    @articulos = Articulo.order(created_at: :desc)
  end

  def aceptar_renta
    @articulo = Articulo.find_by(id: params[:id])
    if(@articulo == nil)
      flash[error_format(1)] = "Ese gadget no existe"
    else
      @articulo.pedido = false
      @articulo.rentado=true
      if @articulo.save
        flash[notice_format(1)] = "Se aceptó la renta"
      else
        errors=0
        @articulo.errors.full_messages.each do |msg|
          flash[error_format(++errors)]=msg
        end
      end
   end
    redirect_to '/admin/gadgets_pedidos'
  end

  def cancelar_renta
    @articulo = Articulo.find_by(id: params[:id])
    if(@articulo == nil)
      flash[error_format(1)] = "Ese gadget no existe"
    else
      @articulo.pedido = false
      @articulo.rentado= false
      @articulo.ultimoPedido = nil
      if @articulo.save
        flash[notice_format(1)] = "El gadget vuelve a estar disponible"
      else
        errors=0
        @articulo.errors.full_messages.each do |msg|
          flash[error_format(++errors)]=msg
        end
      end
   end
    redirect_back(fallback_location: '/admin/gadgets')
  end

  def asignar_admin

  end

  def admin_assign
    @user=Usuario.find_by(id: params[:usuario][:id])
    if (@user == nil)
      flash[danger_format(1)] = "no existe ese usuario"
    elsif(@user.update(admin: ("0"!=params[:usuario][:admin])))
      flash[success_format(2)] = "Se actualizó al usuario"
    else
      flash[error_format(1)] = "algo salio mal"
      errors=0
      @user.errors.full_messages.each do |msg|
        flash[error_format(++errors)]=msg
      end
    end
    redirect_to '/admin/users'
  end

  def user_is_admin
      unless logged_in? && is_admin?
        flash[danger_format(3)] = "You must be admin to be here!!"
        redirect_to root_url
      end
  end
end
