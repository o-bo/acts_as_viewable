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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120130223632) do

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "total_views", :force => true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.integer  "views"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "total_views", ["viewable_type", "viewable_id"], :name => "index_total_views_on_viewable_type_and_viewable_id", :unique => true

  create_table "views", :force => true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.string   "ip"
    t.integer  "ttl"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "views", ["viewable_id", "viewable_type", "ip"], :name => "index_views_on_viewable_id_and_viewable_type_and_ip"

end
