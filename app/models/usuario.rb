class Usuario < ApplicationRecord
  
  has_many :productos
  has_many :carritos
  has_many :compras
  
  before_save :correo_a_minusculas
 
  validates :nombre,		  presence: { message: "Debe escribir un nombre" }, 
  							format:   {with: /\A[a-zA-Z ]+\z/, message: "Solo se permiten letras para el nombre" }, 
  							length:   {minimum: 3, :message => "El nombre debe tener por lo menos 3 letras"}

  validates :contrasena,	presence: { message: "Se debe escribir una contrasena" }, 
  							length:   {minimum: 5, :message => "La contrasena debe tener por lo menos 5 caracteres" }

  validates :correo,		  presence: { message: "Se debe que escribir un correo"}, 
							format:     { with: /\A[\w+\-.]+@+c+a+n+t+v+\.+c+o+m+\.+v+e/i, message: "Formato de correo incorrecto, debe ser algo como {letra(s) y/o numero(s)}{@cantv.com.ve}" }, 
							uniqueness: {case_sensitive: false ,message: "Este correo ya esta registrado"}

  validates :ubicacion,  	presence: { message: "Se debe que escribir una ubicacion {una direccion generalizada, ejemplo: \"NEA\"}"},
  							length:   {minimum: 3, :message => "La ubicacion debe tener por lo menos 3 letras"}

  validates :gerencia,	  presence: { message: "Se debe escribir una gerencia"},
  							length:   {minimum: 3, :message => "La gerencia debe tener por lo menos 3 letras"}



    # somewhere in your model (typically in a protected method)
  protected
    def correo_a_minusculas
      self.correo.downcase!
    end

#  def to_s
#    nombre
#  end
end



