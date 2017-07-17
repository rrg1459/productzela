class ProductosController < ApplicationController
    before_action :limpiar_carrito
    before_action :contador_articulos_carrito
    before_action :usuario_autorizado
    before_action :rol_autorizado, except: [:mostrar, :ajustar]
    before_action :set_producto, only: [:ajustar, :show, :edit, :update, :destroy]

    helper_method :ordena_columna, :ordena_direccion

  def index
    @productos = Producto.where(f_eliminado: nil)
  end





  def mostrar
    if params[:criterio].present?
      @productos = Producto.where(["(nombre ILIKE ? or descripcion ILIKE ?) and disponible is true and f_eliminado is NULL and cantidad_existencia > 0", 
                   "%#{params[:criterio]}%", "%#{params[:criterio]}%"]).
                   order(ordena_columna + ' ' + ordena_direccion)
    else
      @productos = Producto.where("disponible is true and f_eliminado is NULL and cantidad_existencia > 0").order(ordena_columna + ' ' + ordena_direccion)
    end
  end

  def ajustar
   # esta logica deberia ri en el modelo de producto pero falla al borrar un articulo, ya lo vuelve a crear automaticamente
   # clave de busqueda xxxmodeloproductocarrito
   #$celular = session[:celular_usuario]
   #@producto.update(cantidad_existencia: @producto.cantidad_existencia - @producto.cantidad_por_venta)
   #@producto.update(cantidad_existencia: @producto.cantidad_existencia + @carrito.cantidad)

    @carrito             = Carrito.new
    @carrito.celular     = session[:celular_usuario]
    @carrito.producto_id = @producto.id
    @carrito.nombre      = @producto.nombre
    @carrito.descripcion = @producto.descripcion
    @carrito.precio      = @producto.precio
    @carrito.cantidad    = @producto.cantidad_por_venta
    @carrito.f_creado    = Time.now
    @carrito.save
    redirect_back fallback_location: mostrar_url
  end

  def show
  end

  # GET /productos/new
  def new
    @producto = Producto.new
  end

  # GET /productos/1/edit
  def edit
  end

  # POST /productos
  # POST /productos.json
  def create
    @producto = Producto.new(parametros_producto)
    @producto.f_creado = Time.now

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'El producto fue ingresado al sistema' }
        format.json { render :show, status: :created, location: @producto }
      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(parametros_producto)
        format.html { redirect_to @producto, notice: 'El producto fue editado correctamente' }
        format.json { render :show, status: :ok, location: @producto }
      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
#   @producto.destroy
    @producto.update(disponible: false, f_eliminado: Time.now)
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'El producto fue eliminado del sistema' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parametros_producto
      params.require(:producto).permit(:f_creado, :f_eliminado, :disponible, :cantidad_por_venta, :cantidad_existencia, :nombre, :descripcion, :precio)
    end

    def ordena_columna
      Producto.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def ordena_direccion
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
    end

end
