class CreateCarritos < ActiveRecord::Migration[5.0]
  def change
    create_table :carritos do |t|
      t.boolean :abierto
      t.string :celular, limit: 11
      t.integer :compra_id
      t.integer :producto_id
      t.integer :cantidad, default: 1
      t.text :nombre
      t.text :descripcion
      t.decimal :precio
      t.date :f_creado
      t.date :f_eliminado

      t.timestamps
    end

    add_foreign_key "carritos", "compras",     name: "carritos_compra_id_fkey"
    add_foreign_key "carritos", "productos",   name: "carritos_producto_id_fkey"
    add_foreign_key "carritos", "usuarios",  column: "celular", primary_key: "celular", name: "carritos_celular_fkey"

  end
end
