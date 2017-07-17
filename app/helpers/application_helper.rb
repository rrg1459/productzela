module ApplicationHelper 
 	def sortable(column, title = nil)
		title ||= column.titleize
		css_class =  "current ini"
		css_class =  "current #{ordena_direccion}" if column == ordena_columna
 		direction = column == ordena_columna && ordena_direccion == "asc" ? "desc" : "asc"
		link_to title, { sort: column, direction: direction }, { class: css_class }
	end
end
