json.extract! carrito, :id, :abierto, :celular, :producto_id, :compra_id, :cantidad, :precio, :f_creado, :f_anulado, :f_eliminado, :created_at, :updated_at
json.url carrito_url(carrito, format: :json)
