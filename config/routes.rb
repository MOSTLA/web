Rails.application.routes.draw do
  get 'sesions/admin'
  #get 'paginas_admin/editar_tendencias'
  #get 'paginas_admin/editar_elementos'
  #get 'paginas_admin/editar_temas'
  #get 'paginas_admin/editar_presentacion'
  #get 'paginas_admin/ver_presentacion'
  #get 'paginas_admin/proyectos'
  #get 'paginas_admin/revision_proyecto'
  #get 'paginas_admin/pedidos_articulos'
  #get 'paginas_admin/editar_productos'
  #get 'paginas_usuario/ver_proyectos'
  #get 'paginas_usuario/editar_proyecto'
  #get 'paginas_usuario/agregar_proyecto'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/nosotros', to: 'paginas_principales#nosotros'
  get '/contactos', to: 'paginas_principales#contactos'

 #to delete
 get '/sesions/crear_usuarios'
 post '/usuarios', to: 'usuarios#create'
 patch '/usuarios/:id', to: 'usuarios#edit'
 delete '/usuarios/:id', to: 'usuarios#delete'
 get '/account', to: 'paginas_usuario#my_account'

  #sessions
  get    '/admin',   to: 'sesions#admin'
  post   '/login',   to: 'sesions#create'
  delete '/logout',  to: 'sesions#destroy'

  #paginas admin
  get '/admin/proyectos', to: 'paginas_admin#proyectos'
  get '/admin/proyecto/:id', to:'paginas_admin#revision_proyecto'

  get '/admin/tendencias', to: 'paginas_admin#editar_tendencias'
  get '/admin/tendencia/:id', to:'paginas_admin#editar_elementos'

  get '/admin/gadgets', to: 'paginas_admin#editar_productos'
  get '/admin/gadgets_en_renta', to:'paginas_admin#articulos_rentados'
  get '/admin/gadgets_pedidos', to:'paginas_admin#pedidos_articulos'

  get '/admin/temas', to: 'paginas_admin#editar_temas'
  get '/admin/tema/:id', to: 'paginas_admin#editar_presentacion'

  get '/presentacion/:name', to: 'paginas_admin#ver_presentacion'


  #users
  patch '/admin', to: 'paginas_admin#admin_assign'
  get '/admin/users', to: 'paginas_admin#asignar_admin'


  #Proyectos links
  get '/mis_proyectos', to: 'paginas_usuario#ver_proyectos'
  get '/nuevo_proyecto', to: 'paginas_usuario#agregar_proyecto'
  get '/mi_proyecto/:name', to: 'paginas_usuario#editar_proyecto'

  get '/proyectos', to: 'paginas_principales#proyectos'
  get '/proyecto/:name', to: 'paginas_principales#proyecto'

  #Proyectos edit
  post '/proyectos', to: 'proyectos#create'
  patch '/proyectos/:id', to: 'proyectos#edit'
  delete '/proyectos/:id', to: 'proyectos#delete'
  patch '/admin/proyectos/:id', to: 'proyectos#edit_admin'

  #comentarios edit
  post '/comentario', to: 'comentarios#create'
  delete '/comentario/:id', to: 'comentarios#delete'

  #tendencias links
  get '/tendencias', to: 'paginas_principales#Pag_principal'
  get '/tendencia/:name', to: 'paginas_principales#tendencia'

  #tendencias y elementos edit
  post '/tendencia', to: 'tendencias#create'
  patch '/tendencia/:id', to: 'tendencias#edit'
  delete '/tendencia/:id', to: 'tendencias#delete'

  post '/elemento', to: 'elementos#create'
  patch '/elemento/:id', to: 'elementos#edit'
  delete '/elemento/:id', to: 'elementos#delete'


  #Gadgets disponibles
  get '/gadgets', to: 'paginas_principales#productos'
  #get '/gadget/:name', to: 'paginas_principales#producto'

  root 'paginas_principales#Pag_principal'

  #gadgets edit
  post '/articulo', to: 'articulos#create'
  patch '/articulo/:id', to: 'articulos#edit'
  delete '/articulo/:id', to: 'articulos#delete'

  #gadgets permisos
  post 'renta_gadget/:id', to: 'paginas_principales#rentar'
  get 'admin/permitir/:id', to: 'paginas_admin#aceptar_renta'
  get 'admin/negar/:id', to: 'paginas_admin#cancelar_renta'

  #presentaciones edit
  post '/tema', to: 'temas#create'
  patch '/tema/:id', to: 'temas#edit'
  delete '/tema/:id', to: 'temas#delete'
  post '/tema/add/:id', to: 'temas#add_photo'
  patch '/tema/change/:id', to: 'temas#change'
  delete '/tema/slide/:id', to: 'temas#delete_slide'
end
