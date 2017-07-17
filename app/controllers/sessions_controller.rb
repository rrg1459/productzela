class SessionsController < ApplicationController
  before_action :limpiar_carrito
  before_action :contador_articulos_carrito  
  
  def nueva
  end

  def crear
      celular = (params[:area]) + (params[:numero])

      if Usuario.exists?(celular)
         @usuario = Usuario.find(celular)
         if @usuario.contrasena == (params[:contrasena])
            if @usuario.f_eliminado == nil
                @usuario.update(fh_sesion: Time.now.strftime("%Y%m%d%H%M"))
                session[:celular_usuario] = @usuario.celular
                session[:rol_usuario] = @usuario.rol
                redirect_to '/', notice: '*** Bienvenido al sistema ***'
            else
                redirect_to '/', notice: '*** Usuario eliminado, ponganse en contacto con el administrador ***'
            end
          else
            # If user's login doesn't work, send them back to the login form.
            redirect_to '/', notice: '*** error en usuario y/o contrasena ***'
            #redirect_to '/entrar', notice: '*** error en usuario y/o contrasena ***' 
          end
      else
	        redirect_to '/', notice: '*** Usuario no existe ***'
          #redirect_to '/entrar', notice: '*** Usuario no existe ***'
      end	
  end
  
  def cerrar
    session[:celular_usuario] = nil
    session[:rol_usuario] = nil
    redirect_to '/', notice: '*** sesion cerrada ***'
   #redirect_to '/entrar', notice: '*** sesion cerrada ***'
  end

end