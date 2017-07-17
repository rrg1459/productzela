class Carrito < ApplicationRecord

  has_many :productos
  has_one  :compra

  after_create :restar_la_cantidad_al_producto

  before_destroy :sumar_la_cantidad_al_producto

  private
    def sumar_la_cantidad_al_producto
      @producto = Producto.find(self.producto_id)
      @producto.update(cantidad_existencia: @producto.cantidad_existencia + self.cantidad)
    end

    def restar_la_cantidad_al_producto
      @producto = Producto.find(self.producto_id)
      @producto.update(cantidad_existencia: @producto.cantidad_existencia - self.cantidad)
    end
  
end
