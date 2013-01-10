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

ActiveRecord::Schema.define(:version => 20130104170403) do

  create_table "authors", :force => true do |t|
    t.string   "nom"
    t.string   "prenom"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "authors", ["user_id", "created_at"], :name => "index_authors_on_user_id_and_created_at"

  create_table "publications", :force => true do |t|
    t.string   "titre"
    t.string   "typePublication"
    t.string   "nom"
    t.string   "annee"
    t.string   "mois"
    t.string   "pages"
    t.string   "notes"
    t.string   "resume"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "author_id"
    t.integer  "publication_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "relationships", ["author_id", "publication_id"], :name => "index_relationships_on_author_id_and_publication_id", :unique => true
  add_index "relationships", ["author_id"], :name => "index_relationships_on_author_id"
  add_index "relationships", ["publication_id"], :name => "index_relationships_on_publication_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
