# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160128123353) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencias", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "zona"
    t.integer  "numero"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "turnos", force: :cascade do |t|
    t.integer  "agencia_id"
    t.string   "nombre"
    t.string   "asunto"
    t.text     "descripcion"
    t.datetime "hora_ingreso"
    t.datetime "hora_atencion"
    t.datetime "hora_finalizacion"
    t.text     "comentario"
    t.integer  "usuario_ingreso_id"
    t.integer  "usuario_atencion_id"
    t.integer  "estado",              default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "type"
  end

  add_index "turnos", ["agencia_id"], name: "index_turnos_on_agencia_id", using: :btree
  add_index "turnos", ["usuario_atencion_id"], name: "index_turnos_on_usuario_atencion_id", using: :btree
  add_index "turnos", ["usuario_ingreso_id"], name: "index_turnos_on_usuario_ingreso_id", using: :btree

  create_table "usuarios", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.integer  "agencia_id"
    t.integer  "rol",                    default: 0
    t.integer  "estado",                 default: 0
    t.string   "codigo"
    t.string   "correo"
    t.string   "login"
    t.string   "cedula"
    t.string   "password_digest"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "usuarios", ["agencia_id"], name: "index_usuarios_on_agencia_id", using: :btree
  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
