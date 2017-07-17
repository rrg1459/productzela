class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :celular
      t.string :contrasena
      t.string :rol
      t.string :nombre
      t.string :ubicacion
      t.string :correo
      t.string :gerencia
      t.string :telefono
      t.datetime :fh_sesion
      t.date :f_creado
      t.date :f_actualizado

      t.timestamps
    end
  end
end
