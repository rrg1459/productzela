class CarritosController < ApplicationController
    before_action :limpiar_carrito
    before_action :contador_articulos_carrito
    before_action :set_carrito, only: [:show, :edit, :update, :destroy]

  # GET /carritos
  # GET /carritos.json
  def index
    @carritos = Carrito.where(celular: session[:celular_usuario], compra_id: nil, f_eliminado: nil)
  end

  def listado_todos_los_carritos
    @carritos = Carrito.all.order("compra_id")
  end

  # GET /carritos/1
  # GET /carritos/1.json
  def show
  end

  # GET /carritos/new
  def new
    @carrito = Carrito.new
  end

  # GET /carritos/1/edit
  def edit
  end

  # POST /carritos
  # POST /carritos.json
  def create
    @carrito = Carrito.new(parametros_de_carrito)

    respond_to do |format|
      if @carrito.save
        format.html { redirect_to @carrito, notice: 'Carrito was successfully created.' }
        format.json { render :show, status: :created, location: @carrito }
      else
        format.html { render :new }
        format.json { render json: @carrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carritos/1
  # PATCH/PUT /carritos/1.json
  def update
    respond_to do |format|
      if @carrito.update(parametros_de_carrito)
        format.html { redirect_to @carrito, notice: 'Carrito was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrito }
      else
        format.html { render :edit }
        format.json { render json: @carrito.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carritos/1
  # DELETE /carritos/1.json
  def destroy
    @carrito.destroy
    respond_to do |format|
      format.html { redirect_to carritos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrito
      @carrito = Carrito.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parametros_de_carrito
      params.require(:carrito).permit(:abierto, :celular, :producto_id, :compra_id, :cantidad, :precio, :f_creado, :f_anulado, :f_eliminado)
    end

end
