json.extract! producto, :id, :f_creado, :f_eliminado, :disponible, :cantidad_por_venta, :cantidad_existencia, :nombre, :descripcion, :precio, :created_at, :updated_at
json.url producto_url(producto, format: :json)
