json.extract! usuario, :id, :celular, :contrasena, :rol, :nombre, :ubicacion, :correo, :gerencia, :telefono, :fh_sesion, :f_creado, :f_actualizado, :created_at, :updated_at
json.url usuario_url(usuario, format: :json)
