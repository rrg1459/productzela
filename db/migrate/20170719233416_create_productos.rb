class CreateProductos < ActiveRecord::Migration[5.0]
  def change
    create_table :productos do |t|
      t.boolean :disponible
      t.integer :cantidad_por_venta, default: 1
      t.integer :cantidad_existencia
      t.text :nombre
      t.text :descripcion
      t.decimal :precio
      t.date :f_creado
      t.date :f_eliminado

      t.timestamps
    end
  end
end
