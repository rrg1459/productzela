module UsuariosHelper
	def checked(area)
  		@usuario.articulo_ids.nil? ? false : @usuario.articulo_ids.match(area)
	end
end
