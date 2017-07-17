json.extract! banco, :id, :f_creado, :nombre, :tipo_cuenta, :numero_cuenta, :titular, :cedula, :correo, :created_at, :updated_at
json.url banco_url(banco, format: :json)
