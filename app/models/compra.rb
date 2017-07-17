class Compra < ApplicationRecord

  has_many   :carritos, dependent: :destroy
  belongs_to :usuario, foreign_key: "celular"


  attr_accessor :validado

# before_save :primera_letra_mayusculas

  validates :nombre_banco_origen,	presence: { message: "Debe escribir el nombre del banco donde se hizo la transaccion" }

  validates :numero_transaccion,  presence: { message: "Debe escribir el numero de confirmacion" } 

#   esto si funciona, solo que se cambio por un select y se dejo en comentario para tener la sintaxis de esto
  validates :tipo_transaccion, inclusion: { in: %w(Deposito Transferencia),
            message: "Debe seleccionar Deposito o Transferencia" }

  validates :entregado_por, presence: { message: "Debe escribir quien entrego la compra" }, 
            length: {minimum: 3, :message => "El nombre de quien entrega debe tener por lo menos 3 letras"}, if: :validado?

  validates :comentarios,   presence: { message: "Debe escribir un comentario" }, 
            length: { in: 6..300, :message => "El comentario debe tener entre 6 y 300 caracateres"}, if: :validado?

  protected
    def primera_letra_mayusculas
      self.tipo_transaccion.capitalize!
    end

    def validado?
     #validado == 'true' || validado == true
      validado == true
    end

end
