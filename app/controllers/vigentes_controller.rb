class VigentesController < ApplicationController
    before_action :limpiar_carrito
    before_action :contador_articulos_carrito
    before_action :usuario_autorizado
    before_action :rol_autorizado
    before_action :set_vigente, only: [:edit, :update]

  def index
      if Vigente.any?
         @vigente      = Vigente.first
      else
         @vigente      = Vigente.new
         @vigente.dias = 1
         @vigente.save
      end
      render :edit
  end

  def edit
  end

  def update
    respond_to do |format|
      if @vigente.update(dias_de_vigencia)
        format.html { redirect_to '/entrada/procesos', notice: "*** Se cambio la vigencia del carrito a #{@vigente.dias} dias ***" }
      else
        format.html { render :edit }
      end
    end
  end

  private
    def set_vigente
      @vigente = Vigente.find(params[:id])
    end

    def dias_de_vigencia
      params.require(:vigente).permit(:dias)
    end
end
