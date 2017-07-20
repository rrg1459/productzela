class CreateBancos < ActiveRecord::Migration[5.0]
  def change
    create_table :bancos do |t|
      t.text :nombre
      t.text :tipo_cuenta
      t.string :numero_cuenta
      t.text :titular
      t.string :cedula
      t.string :correo
      t.date :f_creado
      t.date :f_eliminado

      t.timestamps
    end
  end
end
