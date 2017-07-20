class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios, id: false do |t|
      t.string :celular, limit: 11
      t.string :contrasena
      t.text :rol, default: :opera
      t.text :nombre
      t.text :ubicacion
      t.string :correo
	  t.string :gerencia
	  t.string :telefono
      t.timestamp :fh_sesion
      t.date :f_creado
      t.date :f_actualizado
      t.date :f_eliminado

      t.timestamps
    end
    execute "ALTER TABLE usuarios ADD PRIMARY KEY (celular);"
  end
end
