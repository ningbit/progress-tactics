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

ActiveRecord::Schema.define(:version => 20131015150715) do

  create_table "characters", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "team_id"
    t.integer  "current_job_id", :default => 1
    t.integer  "total_exp",      :default => 0
    t.integer  "color",          :default => 1
    t.string   "gender",         :default => "M"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "job_classes", :force => true do |t|
    t.string   "name"
    t.string   "requirements"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "jobs", :force => true do |t|
    t.integer  "job_class_id"
    t.integer  "character_id"
    t.integer  "level",        :default => -1
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "tasks", :force => true do |t|
    t.string   "name"
    t.string   "contents"
    t.integer  "status",       :default => 0
    t.integer  "exp",          :default => 50
    t.float    "hours",        :default => 0.5
    t.integer  "character_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
