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

ActiveRecord::Schema.define(version: 2018_12_07_221838) do

  create_table "articulos", force: :cascade do |t|
    t.string "nombre"
    t.string "propietario"
    t.string "imagen"
    t.text "descripcion"
    t.boolean "pedido", default: false
    t.boolean "rentado", default: false
    t.float "precio", default: 0.0
    t.string "ultimoPedido"
    t.datetime "fechaPedido"
    t.integer "elemento_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["elemento_id"], name: "index_articulos_on_elemento_id"
  end

  create_table "comentarios", force: :cascade do |t|
    t.string "matricula"
    t.text "comentario"
    t.integer "proyecto_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proyecto_id"], name: "index_comentarios_on_proyecto_id"
  end

  create_table "elementos", force: :cascade do |t|
    t.string "nombre"
    t.string "link"
    t.string "foto"
    t.text "descripcion"
    t.integer "tendencia_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tendencia_id"], name: "index_elementos_on_tendencia_id"
  end

  create_table "ppts", force: :cascade do |t|
    t.string "imagen"
    t.integer "posicion"
    t.integer "tema_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tema_id"], name: "index_ppts_on_tema_id"
  end

  create_table "proyectos", force: :cascade do |t|
    t.string "nombre"
    t.text "contactos"
    t.string "imagen"
    t.text "descripcion"
    t.boolean "aprovado", default: false
    t.boolean "porRevisar", default: false
    t.text "comentario"
    t.integer "usuario_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_proyectos_on_usuario_id"
  end

  create_table "temas", force: :cascade do |t|
    t.string "nombre"
    t.string "fotos", default: "[]"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tendencia", force: :cascade do |t|
    t.string "nombre"
    t.string "abreviacion"
    t.string "imagen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.boolean "admin"
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
