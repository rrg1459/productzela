class ComprasController < ApplicationController
    before_action :limpiar_carrito
    before_action :contador_articulos_carrito
    before_action :usuario_autorizado
    before_action :rol_autorizado, only: [:listado_compras_por_verificar, :listado_compras_para_entregar, :listado_compras_entregadas, :listado_todas_las_compras]
 
    def listado_compras_pendientes
      @compras = Compra.where("celular = ? and numero_transaccion is     null and f_eliminada is NULL", [@celular_sesion]).order("f_creada")
    end

    def listado_compras_realizadas
      @compras = Compra.where("celular = ? and numero_transaccion is not null and f_eliminada is NULL", [@celular_sesion]).order("f_creada")
    end

    def listado_compras_por_verificar
      @compras = Compra.where("numero_transaccion is not null and f_verificada is     null and f_entregada is NULL  and f_eliminada is NULL").order("f_creada")
    end

    def listado_compras_para_entregar
      @compras = Compra.where("numero_transaccion is not null and f_verificada is not null and f_entregada is     NULL  and f_eliminada is NULL").order("f_creada")
    end

    def listado_compras_entregadas
      @compras = Compra.where("numero_transaccion is not null and f_verificada is not null and f_entregada is not NULL  and f_eliminada is NULL").order("f_creada")
    end
    
    def listado_todas_las_compras
      @compras = Compra.all.order("f_creada")
    end

    def continuar_compra
       @compra = Compra.find(params[:id])
       @banco  = Banco.find(@compra.banco_id)
    end

    def update
       @compra = Compra.find(params[:id])
       @banco  = Banco.find(@compra.banco_id)
       if @compra.update(parametros_compra)
          # al final lo que va a quedar en el redirect_to es mostrar el detalle de la compra
          redirect_to detalle_compra_path(params[:id]), notice: 'La compra fue procesada.'
        else 
          render :continuar_compra
       end
    end

    def detalle_compra
       @compra   = Compra.find(params[:id])
       @banco    = Banco.find(@compra.banco_id)
       @carritos = Carrito.where(compra_id: @compra.id)
    end
    
    def ver_detalle_para_verificar_compra
       @compra   = Compra.find(params[:id])
       @banco    = Banco.find(@compra.banco_id)
       @carritos = Carrito.where(compra_id: @compra.id)
    end

    def verificar_compra
       @compra   = Compra.find(params[:id])
       @carritos = Carrito.where(compra_id: @compra.id)
       @compra.update(f_verificada: Time.now)
       redirect_to listado_compras_por_verificar_path, notice: 'La compra fue verificada'
    end
    
    def ver_detalle_registrar_compra
       @compra   = Compra.find(params[:id])
       @banco    = Banco.find(@compra.banco_id)
       @carritos = Carrito.where(compra_id: @compra.id)
    end

    def registrar_compra
       @compra   = Compra.find(params[:id])
       @banco    = Banco.find(@compra.banco_id)
       @carritos = Carrito.where(compra_id: @compra.id)
       @compra.validado = true
       @compra.f_entregada = Time.now
       if @compra.update(parametros_compra)
         redirect_to listado_compras_para_entregar_path, notice: 'Se registro la entrega de la compra'
       else
         render :ver_detalle_registrar_compra
       end
    end

    def new
        if @cantidad == 0
          redirect_back fallback_location: '/', notice: 'Usted  no tiene articulos en su carrito para iniciar una compra'
        end
    	@bancos = Banco.where(f_eliminado: nil)
    end

    def create
    end

    def edit
      @banco    = Banco.find(params[:id])
      @banco_id = params[:id]
    end

    def registrar
       @compra                    = Compra.new
       @compra.celular            = @celular_sesion
       @compra.banco_id           = params[:id]
       @compra.f_creada           = Time.now
       @compra.cantidad_articulos = @cantidad
       @compra.total_compra       = @total_carrito
       @compra.save(validate: false)
       @carritos = Carrito.where(celular: session[:celular_usuario], compra_id: nil, f_eliminado: nil)
       @carritos.each do |car|
          car.update(compra_id: @compra.id)
       end
       redirect_to listado_compras_pendientes_url
    end

    def cancelar_sin_ID
       @carritos = Carrito.where(celular: @celular_sesion, compra_id: nil)
       @carritos.each do |car|
          @producto = Producto.find(car.producto_id)
          car.destroy
       end
      redirect_to '/', notice: 'La compra fue cancelada'
    end

    def cancelar_con_ID
       Compra.destroy(params[:id])
       redirect_to listado_compras_pendientes_path, notice: 'La compra fue cancelada'
    end

    def borrar_compra
      @compra = Compra.find(params[:id])
      @compra.update_columns(f_eliminada: Time.now)
      @carritos = Carrito.where(compra_id: params[:id])
      @carritos.each do |car|
         car.update(f_eliminado: Time.now)
      end
      redirect_to listado_todas_las_compras_url
    end

    def restaurar_compra
      @compra = Compra.find(params[:id])
      @compra.update_columns(f_eliminada: nil)
      @carritos = Carrito.where(compra_id: params[:id])
      @carritos.each do |car|
         car.update(f_eliminado: nil)
      end
      redirect_to listado_todas_las_compras_url
    end

  private
    def parametros_compra
      params.require(:compra).permit(:f_transaccion, :dot_mismo_banco, :nombre_banco_origen, :numero_transaccion, :tipo_transaccion, :entregado_por, :comentarios)
    end

end

