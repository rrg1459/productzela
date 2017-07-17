class Producto < ApplicationRecord

  def datos
#  "#{nombre}, #{descripcion}, #{"-"*3} Bs.#{precio}"
   "#{nombre} #{descripcion}, Bs.#{precio}"
  end

  has_many                :compras
# puts '------------modelo producto----------------------------------------------------'
#  puts req.inspect
#  puts '------------modelo producto----------------------------------------------------'
#  puts session[:celular_usuario]
#  puts '------------modelo producto----------------------------------------------------'


  after_save :subir_al_carrito

  private
    def subir_al_carrito
 #     Carrito.producto_id = self.id # id de la tabla producto
 #     Carrito.precio      = self.precio # precio de la tabla producto
 #     Carrito.save
 #   end
 #   def subir_al_carrito
 #   	puts '-------------- modelo producto dentro de subir al carrito after save------------------'
 #   	puts Usuario.inspect
 #   	puts $celular
 #  	puts params[:numero]
 #     puts '-------------- modelo producto dentro de subir al carrito after save------------------'

    	#la admiracion despues del create genera un error (excepción) cuando el registro
    	#falla, al contrario de create, el cual simplemente no crea el registro pero no
    	#genera error. Dado que lo estás creando en tu modelo, es mejor utilizar create!
    	#pues tu flujo nunca espera que la creación del registro falle. 
    	#Haz la prueba en la consola de rails, y verás el resultado.


  #  esta logica es correcta solo que al borrar un articulo del carrito esta logica lo vuelve a crear, me falta el conocimiento para correir esto
  #  clave de busqueda xxxmodeloproductocarrito
  #  Carrito.create!(producto_id: id, precio: precio, celular: $celular, f_creado: Time.now)
    end

 
end
