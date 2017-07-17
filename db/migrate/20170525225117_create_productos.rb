class CreateProductos < ActiveRecord::Migration[5.0]
  def change
    create_table :productos do |t|
      t.date :f_creado
      t.date :f_eliminado
      t.boolean :disponible
      t.integer :cantidad_por_venta
      t.integer :cantidad_existencia
      t.text :nombre
      t.text :descripcion
      t.float :precio

      t.timestamps
    end
  end
end
