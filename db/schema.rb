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

ActiveRecord::Schema.define(version: 20150519091144) do

  create_table "stockdatas", force: :cascade do |t|
    t.string   "stocknumber", limit: 255
    t.string   "stockname",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stockdatas", ["stockname", "stocknumber"], name: "index_stockdatas_on_stockname_and_stocknumber", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "wechatopenid", limit: 255
    t.string  "nickname",     limit: 255
    t.string  "headimgurl",   limit: 255
    t.string  "city",         limit: 255
    t.string  "province",     limit: 255
    t.string  "country",      limit: 255
    t.boolean "isAnalyst",    limit: 1,   default: false
  end

end
