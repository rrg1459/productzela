compras = Compra.all
compras.each do |borrar|
	borrar.destroy
end

carritos = Carrito. all
carritos.each do |borrar|
	borrar.destroy
end


vigentes = Vigente.all
vigentes.each do |borrar|
	borrar.destroy
end

Vigente.create(dias: 1)
vigente = Vigente.first

puts
puts 'Dias de Vigencia del carrito'
puts '---- -- -------- --- -------'
puts "** #{vigente.dias} **"
puts

bancos = Banco.all
bancos.each do |borrar|
  borrar.destroy
end

lista_de_bancos = [
[ '2014-07-11', 'Banco Construccion', 'corriente', '0201-0023-11-0000004855', 'Bill Gates   ', 'V-18.341.834', 'bgates@hotmail.com', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '2014-07-11', 'Banco Construccion', 'corriente', '0201-0023-11-0000004855', 'Bill Gates   ', 'V-18.341.834', 'bgates@hotmail.com', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '2016-09-18', 'Banco Union       ', 'corriente', '0305-0117-65-0000760123', 'Bill Gates   ', 'V-18.341.834', 'bgates@hotmail.com', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '2015-02-12', 'Banco Consolidado ', 'ahorro',    '0104-0204-32-0001625389', 'Carlos Slim  ', 'V-23.112.846', 'cslim@hotmail.com',  '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '2015-02-12', 'Banco SOFITASA    ', 'ahorro',    '0723-1008-24-000oooo116', 'Warren Buffet', 'V-4.012.003', 'wbuffet@hotmail.com', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '2015-02-12', 'Banco del Caribe  ', 'corriente', '0104-0204-32-0001625389', 'Warren Buffet', 'V-4.012.003', 'wbuffet@hotmail.com', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '2015-02-12', 'Banco Federal     ', 'corriente', '0104-0204-32-0001625389', 'Henry Ford   ', 'V-23.112.84', 'hford@hotmail.com',   '2011-11-11 16:25', '2011-11-11 16:25' ]
]
puts
puts 'Lista de Bancos:' 
puts "-- Nombre \t\t-- Tipo_cta \t-- Numero_cuenta \t\t-- Titular \t\t--"
lista_de_bancos.each do |f_creado, nombre, tipo_cuenta, numero_cuenta, titular, cedula, correo, created_at, updated_at|
  Banco.create( f_creado: f_creado, nombre: nombre, tipo_cuenta: tipo_cuenta, numero_cuenta: numero_cuenta, titular: titular, cedula: cedula, correo: correo, created_at: created_at, updated_at: updated_at )
  puts "** #{nombre}\t** #{tipo_cuenta}\t** #{numero_cuenta}\t** #{titular}\t**"
end 

usuarios = Usuario.all
usuarios.each do |borrar|
  borrar.destroy
end

lista_de_usuarios = [
[ '04141111111', 'clave',  'admin', 'Homero Simpson    ', 'El Nea',       'rrod11@cantv.com.ve',    'GOTIC',   '02125002503', '2016-08-19',   '2016-08-19',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04262222222', 'clave',  'admin', 'kevin Margarito   ', 'Los Cortijos', 'krod3@cantv.com.ve',     'GOTID',   '02125002501', '2016-08-19',   '2016-08-19',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04128888888', 'clave',  'opera', 'Carolina Herrera  ', 'EL ROSAL ',    'psinf5@cantv.com.ve',    'GOTID',   '02125001190', '2016-02-07',   '2016-03-07',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04263178394', 'clave',  'opera', 'Napoleon Bonaparte', 'EL Rosal',     'mrod10@cantv.com.ve',    'GOTID',   '02125002505', '2016-08-19',   '2016-08-19',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04242341234', 'clave',  'opera', 'Pato Lucas        ', 'EL Rosal',     'aoj210@cantv.com.ve',    'GOTID',   '02125002505', '2016-08-19',   '2016-08-19',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04261216677', 'clave',  'opera', 'Bill Clinton      ', 'EL Nea',       'nlai40@cantv.com.ve',    'GOTID',   '02125002505', '2016-08-19',   '2016-08-19',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04161116565', 'clave',  'opera', 'Julio Verne       ', 'EL Nea',       'sand3@cantv.com.ve',     'GOTID',   '02125002505', '2016-08-19',   '2016-08-19',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04245051234', 'clave',  'opera', 'Johhny Depp       ', 'Los Cortijos', 'cram120@cantv.com.ve',   'GOTID',   '02125002505', '2016-08-19',   '2016-08-19',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04146113465', 'clave',  'opera', 'Juana La Loca     ', 'EL Nea ',      'amanz2@cantv.com.ve',    'GOTID',   '02125003477', '2016-02-07',   '2016-03-07',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04142219011', 'clave',  'opera', 'Galileo Galilei   ', 'EL Nea',       'chern44@cantv.com.ve',   'GOTID',   '02125003476', '1-05-2016',    '2016-06-01',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ],
[ '04242238464', 'clave',  'opera', 'Jack Bauer        ', 'EL Rosal',     'mrod10@cantv.com.ve',    'GOTID',   '02125002505', '2016-08-19',   '2016-08-19',  '2010-08-10 16:25', '2011-11-11 16:25', '2011-11-11 16:25' ]
]
puts
puts
puts 'Lista de Usuarios:' 
puts "-- Nombre \t\t-- Celular \t-- rol \t -- Clave --"
lista_de_usuarios.each do |celular, contrasena, rol, nombre, ubicacion, correo, gerencia, telefono, f_creado, f_actualizado, fh_sesion, created_at, updated_at|
  Usuario.create( celular: celular, contrasena: contrasena, rol: rol, nombre: nombre, ubicacion: ubicacion, correo: correo, gerencia: gerencia, telefono: telefono, f_creado: f_creado, f_actualizado: f_actualizado, fh_sesion: fh_sesion, created_at: created_at, updated_at: updated_at )
  puts "** #{nombre}\t** #{celular}\t** #{rol}\t #{contrasena}\t**"
end 

productos = Producto.all
productos.each do |borrar|
  borrar.destroy
end

lista_de_productos = [
[ '2014-11-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '9',      'harina pan     ',  'marca Juana           ',    '1800' ],
[ '2014-11-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'false',   '3',      'casabe         ',  'grande                ',    '1500' ],
[ '2014-11-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '4',      'casabe         ',  'mediano               ',     '900' ],
[ '2014-11-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '3',      'tortilla       ',  'grande natural        ',    '2500' ],
[ '2015-11-11', '2011-11-11 16:25', '2011-11-11 16:25' , 'false',  '12',      'tortilla       ',  'mediana natural       ',     '850' ],
[ '2016-05-14', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',   '10',      'tortilla       ',  'mediana con ajo       ',     '950' ],
[ '2014-11-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '7',      'saca punta     ',  'electrico             ',   '23000' ],
[ '2016-02-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '6',      'licuadora      ',  'oster                 ',   '89000' ],
[ '2015-07-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'false',   '5',      'salsa de tomate',  'grande marca heinz    ',    '2750' ],
[ '2012-12-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '2',      'arroz          ',  'integral              ',    '3450' ],
[ '2009-10-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '6',      'pantalon       ',  'blue jean             ',    '3900' ],
[ '2015-04-11', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',   '11',      'lapiz          ',  'mongol                ',     '150' ],
[ '2006-05-14', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '2',      'cuaderno       ',  'marca alpes           ',    '2950' ],
[ '2004-08-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '0',      'libreta        ',  'de apuntes            ',    '1800' ],
[ '2014-01-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '6',      'platano        ',  'maduro                ',     '500' ],
[ '2001-04-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'false',   '3',      'pan            ',  'campesino             ',     '700' ],
[ '1987-02-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '4',      'diccionario    ',  'larousse 1999         ',   '29900' ],
[ '2003-09-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '8',      'platos         ',  'juego para 4 personas ',     '900' ],
[ '2007-08-11', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '1',      'cafe           ',  'pequeno marca colombia',     '850' ],
[ '2000-05-14', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',    '0',      'bolsa          ',  'mediana de plastico   ',      '50' ],
[ '1999-02-07', '2011-11-11 16:25', '2011-11-11 16:25' , 'true',   '10',      'CD             ',  'regrabable            ',     '250' ]
]
puts
puts
puts 'Lista de Productos:' 
puts "-- Nombre \t\t-- Descripcion \t\t\t-- existencias \t-- Precio --"
lista_de_productos.each do |f_creado, created_at, updated_at, disponible, cantidad_existencia, nombre, descripcion, precio|
  Producto.create( f_creado: f_creado, created_at: created_at, updated_at: updated_at, disponible: disponible, cantidad_existencia: cantidad_existencia, nombre: nombre, descripcion: descripcion, precio: precio )
  puts "** #{nombre}\t** #{descripcion}\t** #{cantidad_existencia}\t\t** #{precio} **"
end 
puts

