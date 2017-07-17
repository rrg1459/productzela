class BancosController < ApplicationController
    before_action :limpiar_carrito
    before_action :contador_articulos_carrito
    before_action :usuario_autorizado
    before_action :rol_autorizado
    before_action :set_banco, only: [:show, :edit, :update, :destroy]

  # GET /bancos
  # GET /bancos.json
  def index
    @bancos = Banco.where(f_eliminado: nil)
  end

  # GET /bancos/1
  # GET /bancos/1.json
  def show
  end

  # GET /bancos/new
  def new
    @banco = Banco.new
  end

  # GET /bancos/1/edit
  def edit
  end

  # POST /bancos
  # POST /bancos.json
  def create
    @banco          = Banco.new(parametros_banco)
    @banco.f_creado = Time.now
    respond_to do |format|
      if @banco.save
        format.html { redirect_to @banco, notice: 'El banco fue ingresado al sistema' }
        format.json { render :show, status: :created, location: @banco }
      else
        format.html { render :new }
        format.json { render json: @banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bancos/1
  # PATCH/PUT /bancos/1.json
  def update
    respond_to do |format|
      if @banco.update(parametros_banco)
        format.html { redirect_to @banco, notice: 'El banco fue editado correctamente' }
        format.json { render :show, status: :ok, location: @banco }
      else
        format.html { render :edit }
        format.json { render json: @banco.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bancos/1
  # DELETE /bancos/1.json
  def destroy
#   @banco.destroy
    @banco.f_eliminado = Time.now
    @banco.update(marcado_eliminado)
    respond_to do |format|
      format.html { redirect_to bancos_url, notice: 'El banco fue eliminado del sistema' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banco
      @banco = Banco.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parametros_banco
      params.require(:banco).permit(:f_creado, :nombre, :tipo_cuenta, :numero_cuenta, :titular, :cedula, :correo)
    end

    def marcado_eliminado
      params.permit(:id, :f_eliminado) 
    end

end
