Rails.application.routes.draw do

  resources :carritos
  resources :vigentes
  resources :carritos
  resources :compras
  resources :productos
  resources :bancos
  resources :usuarios, param: :celular

  get   'entrada/indice'
  root  'entrada#indice'
  get   'entrada/procesos'

  get   '/entrar'                                => 'sessions#nueva'
  post  '/entrar'                                => 'sessions#crear'
  get   '/cerrar'                                => 'sessions#cerrar'

  post  '/otorgar/:celular'                      => 'usuarios#otorgar',                           as: 'otorgar'
  post  '/revocar/:celular'                      => 'usuarios#revocar',                           as: 'revocar'
  get   '/index_admin'                           => 'usuarios#index_admin',                       as: 'index_admin'

  post  '/ajustar/:id'                           => 'productos#ajustar',                          as: 'ajustar'
  get   '/en_desarrollo'                         => 'entrada#en_desarrollo',                      as: 'en_desarrollo'
  get   '/mostrar'                               => 'productos#mostrar',                          as: 'mostrar'

  post  '/registrar/:id'                         => 'compras#registrar',                          as: 'registrar'
  post  '/cancelar_sin_ID'                       => 'compras#cancelar_sin_ID',                    as: 'cancelar_sin_ID'
  post  '/cancelar_con_ID/:id'                   => 'compras#cancelar_con_ID',                    as: 'cancelar_con_ID'
  get   '/continuar_compra/:id'                  => 'compras#continuar_compra',                   as: 'continuar_compra'
  get   '/detalle_compra/:id'                    => 'compras#detalle_compra',                     as: 'detalle_compra'
  post  '/verificar_compra/:id'                  => 'compras#verificar_compra',                   as: 'verificar_compra'
  match '/registrar_compra/:id'                  => 'compras#registrar_compra',                   as: 'registrar_compra', via: [:get, :post]
  get   '/ver_detalle_para_verificar_compra/:id' => 'compras#ver_detalle_para_verificar_compra',  as: 'ver_detalle_para_verificar_compra'
  get   '/ver_detalle_registrar_compra/:id'      => 'compras#ver_detalle_registrar_compra',       as: 'ver_detalle_registrar_compra'
  get   '/borrar_compra/:id'                     => 'compras#borrar_compra',                      as: 'borrar_compra'
  get   '/restaurar_compra/:id'                  => 'compras#restaurar_compra',                   as: 'restaurar_compra'
  get   '/listado_compras_pendientes'            => 'compras#listado_compras_pendientes',         as: 'listado_compras_pendientes'
  get   '/listado_compras_realizadas'            => 'compras#listado_compras_realizadas',         as: 'listado_compras_realizadas'
  get   '/listado_compras_por_verificar'         => 'compras#listado_compras_por_verificar',      as: 'listado_compras_por_verificar'
  get   '/listado_compras_para_entregar'         => 'compras#listado_compras_para_entregar',      as: 'listado_compras_para_entregar'
  get   '/listado_compras_entregadas'            => 'compras#listado_compras_entregadas',         as: 'listado_compras_entregadas'
  get   '/listado_todas_compras'                 => 'compras#listado_todas_las_compras',          as: 'listado_todas_las_compras'
  get   '/listado_todos_carritos'                => 'carritos#listado_todos_los_carritos',        as: 'listado_todos_los_carritos'

  get   '/nav_tab'                               => 'entrada#nav_tab',                            as: 'nav_tab'

end 