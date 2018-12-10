class PaginasPrincipalesController < ApplicationController

  def Pag_principal
    #flash[danger_format(1)] = "Ese proyecto no existe"
    #flash[danger_format(2)] = "Ese proyecto porque"
    #flash[danger_format(3)] = "Ese proyecto lala"
    #flash[success_format(1)] = "Ese proyecto no existe"
    #flash[error_format(1)] = "Ese proyecto no existe"
    #flash[notice_format(1)] = "Ese proyecto no existe"
    @tendencias = Tendencia.all
  end

  def tendencias
      redirect_to root_url
  end

  def tendencia
    if (params[:name]!=nil && @tendencia = Tendencia.find_by(nombre: params[:name]))
      @elementos = Elemento.where(tendencia_id: @tendencia.id)
    else
      flash[error_format(1)] = "Esa tendencia no existe"
      redirect_to '/tendencias'
    end
  end

  def proyectos

      @proyectos = Proyecto.where(aprovado: true).order(created_at: :desc).all
  end

  def proyecto
    if (params[:name]!=nil && @proyecto = Proyecto.find_by(nombre: params[:name], aprovado: true))
      @comentarios = Comentario.where(proyecto_id: @proyecto.id).order(created_at: :desc)
    else
      flash[error_format(1)] = "That project doesn't exist, or is not approved"
      redirect_to '/proyectos'
    end
  end

  def productos
    @articulos = Articulo.order(rentado: :desc, pedido: :desc)
  end

  def producto
    if (params[:name]!=nil && @articulo = Articulo.find_by(nombre: params[:name]))
    else
      flash[error_format(1)] = "That gadget doesn't exist"
      redirect_to '/gadgets'
    end
  end

  def rentar
    name="";
    if @articulo = Articulo.find_by(id: params[:id])
      name = "#"+@articulo.nombre
      if @articulo.pedido || @articulo.rentado
        flash[error_format(1)] = "That gadget is already taken"
      else
        @articulo.pedido = true
        @articulo.ultimoPedido = params[:renta][:matricula]
        @articulo.fechaPedido = DateTime.now
        if @articulo.save
          flash[success_format(1)] = "recarga la pagina una vez más para asegurar que tu obtuviste el pedido"
        else
          errors=0
          @articulo.errors.full_messages.each do |msg|
            flash[error_format(++errors)]=msg
          end
          flash[notice_format(++errors)]="Checa que tu matricula este completa"
        end
      end
    else
      flash[danger_format(1)] = "That gadget doesn't exist"
    end
    redirect_to '/gadgets'+name
  end

  def contactos
  end

  def nosotros
  end

end
