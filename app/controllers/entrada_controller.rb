class EntradaController < ApplicationController
  before_action :limpiar_carrito
  before_action :contador_articulos_carrito  
  before_action :usuario_autorizado
  before_action :rol_autorizado, except: [:indice, :en_desarrollo]
  #before_action :rol_autorizado, only: [:procesos]
 
  def indice
  end

  def procesos
  end

  def nav_tab
  end

  def en_desarrollo
  end
  
end
