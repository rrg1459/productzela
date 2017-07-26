# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170720184159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "articulos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "celular",     limit: 11
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bancos", force: :cascade do |t|
    t.text     "nombre"
    t.text     "tipo_cuenta"
    t.string   "numero_cuenta"
    t.text     "titular"
    t.string   "cedula"
    t.string   "correo"
    t.date     "f_creado"
    t.date     "f_eliminado"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "carritos", force: :cascade do |t|
    t.boolean  "abierto"
    t.string   "celular",     limit: 11
    t.integer  "compra_id"
    t.integer  "producto_id"
    t.integer  "cantidad",               default: 1
    t.text     "nombre"
    t.text     "descripcion"
    t.decimal  "precio"
    t.date     "f_creado"
    t.date     "f_eliminado"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "clientes", primary_key: "celular", id: :string, limit: 11, force: :cascade do |t|
    t.text     "rol",        default: "opera"
    t.string   "contrasena"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "compras", force: :cascade do |t|
    t.string   "celular",             limit: 11
    t.integer  "banco_id"
    t.integer  "cantidad_articulos"
    t.decimal  "total_compra"
    t.text     "nombre_banco_origen"
    t.string   "numero_transaccion"
    t.text     "entregado_por"
    t.string   "comentarios"
    t.date     "f_creada"
    t.date     "f_transaccion"
    t.date     "f_verificada"
    t.date     "f_entregada"
    t.date     "f_eliminada"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "durmientes", force: :cascade do |t|
    t.string   "celular"
    t.string   "contrasena"
    t.text     "rol"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productos", force: :cascade do |t|
    t.boolean  "disponible"
    t.integer  "cantidad_por_venta",  default: 1
    t.integer  "cantidad_existencia"
    t.text     "nombre"
    t.text     "descripcion"
    t.decimal  "precio"
    t.date     "f_creado"
    t.date     "f_eliminado"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "usuarios", primary_key: "celular", id: :string, limit: 11, force: :cascade do |t|
    t.string   "contrasena"
    t.text     "rol",           default: "opera"
    t.text     "nombre"
    t.text     "ubicacion"
    t.string   "correo"
    t.string   "gerencia"
    t.string   "telefono"
    t.datetime "fh_sesion"
    t.date     "f_creado"
    t.date     "f_actualizado"
    t.date     "f_eliminado"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "vigentes", force: :cascade do |t|
    t.integer  "dias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articulos", "clientes", column: "celular", primary_key: "celular", name: "articulos_celular_fkey"
  add_foreign_key "carritos", "compras", name: "carritos_compra_id_fkey"
  add_foreign_key "carritos", "productos", name: "carritos_producto_id_fkey"
  add_foreign_key "carritos", "usuarios", column: "celular", primary_key: "celular", name: "carritos_celular_fkey"
  add_foreign_key "compras", "bancos", name: "compras_banco_id_fkey"
  add_foreign_key "compras", "usuarios", column: "celular", primary_key: "celular", name: "compras_celular_fkey"
end
