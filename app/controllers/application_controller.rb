class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def usuario_actual
     @celular_sesion = session[:celular_usuario]
     if Usuario.exists?(session[:celular_usuario])
        @usuario_actual ||= Usuario.find(session[:celular_usuario]) if session[:celular_usuario]
     end 
  end
  helper_method :usuario_actual

  def usuario_autorizado
     redirect_to '/entrar' unless usuario_actual
  end

  def rol_autorizado 
#    unless usuario_actual.rol == 'admin' 
#       redirect_to '/'
#    end 
     redirect_to '/' unless usuario_actual.rol == 'admin' 
  end

  def limpiar_carrito
    @vigente = Vigente.first
    diasV    = @vigente.dias
    Carrito.where(compra_id: nil).find_each do |carrito|
      diasD = Time.now.strftime("%Y%j").to_i - carrito.f_creado.strftime("%Y%j").to_i
        if diasD < diasV
          nil
        else
          carrito.destroy
        end
    end
 end

  def contador_articulos_carrito
    @cantidad      = 0
    @total_carrito = 0
    Carrito.where(celular: session[:celular_usuario], compra_id: nil, f_eliminado: nil).find_each do |carrito|
      @cantidad      += carrito.cantidad
      @total_carrito += carrito.precio
    end
  end

end




