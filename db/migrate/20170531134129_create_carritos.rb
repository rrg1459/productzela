class CreateCarritos < ActiveRecord::Migration[5.0]
  def change
    create_table :carritos do |t|
      t.boolean :abierto
      t.string :celular
      t.integer :producto_id
      t.integer :compra_id
      t.integer :cantidad
      t.float :precio
      t.date :f_creado
      t.date :f_anulado
      t.date :f_eliminado

      t.timestamps
    end
  end
end
