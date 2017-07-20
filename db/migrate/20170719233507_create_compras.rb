class CreateCompras < ActiveRecord::Migration[5.0]
  def change
    create_table :compras do |t|
      t.string :celular, limit: 11
      t.integer :banco_id
      t.integer :cantidad_articulos
      t.decimal :total_compra
      t.text :nombre_banco_origen
      t.string :numero_transaccion
      t.text :entregado_por
      t.string :comentarios
      t.date :f_creada
      t.date :f_transaccion
      t.date :f_verificada
      t.date :f_entregada
      t.date :f_eliminada

      t.timestamps
    end

    add_foreign_key "compras",  "bancos",      name: "compras_banco_id_fkey"  
    add_foreign_key "compras",  "usuarios",  column: "celular", primary_key: "celular", name: "compras_celular_fkey"

  end
end
