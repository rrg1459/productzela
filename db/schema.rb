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

ActiveRecord::Schema.define(version: 20170531134129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bancos", force: :cascade do |t|
    t.date     "f_creado"
    t.text     "nombre"
    t.text     "tipo_cuenta"
    t.string   "numero_cuenta"
    t.text     "titular"
    t.string   "cedula"
    t.string   "correo"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "carritos", force: :cascade do |t|
    t.boolean  "abierto"
    t.string   "celular"
    t.integer  "producto_id"
    t.integer  "compra_id"
    t.integer  "cantidad"
    t.float    "precio"
    t.date     "f_creado"
    t.date     "f_anulado"
    t.date     "f_eliminado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["article_id"], name: "index_comments_on_article_id", using: :btree
  end

  create_table "libros", primary_key: "codigo", id: :integer, default: -> { "nextval('sec_codigolibros'::regclass)" }, force: :cascade do |t|
    t.string "titulo",    limit: 30
    t.string "autor",     limit: 30
    t.string "editorial", limit: 15
  end

  create_table "productos", force: :cascade do |t|
    t.date     "f_creado"
    t.date     "f_eliminado"
    t.boolean  "disponible"
    t.integer  "cantidad_por_venta"
    t.integer  "cantidad_existencia"
    t.text     "nombre"
    t.text     "descripcion"
    t.float    "precio"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "celular"
    t.string   "contrasena"
    t.string   "rol"
    t.string   "nombre"
    t.string   "ubicacion"
    t.string   "correo"
    t.string   "gerencia"
    t.string   "telefono"
    t.datetime "fh_sesion"
    t.date     "f_creado"
    t.date     "f_actualizado"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "vigentes", force: :cascade do |t|
    t.integer  "dias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "articles"
end
