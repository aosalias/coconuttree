# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100419202235) do

  create_table "courses", :force => true do |t|
    t.string   "title"
    t.string   "time"
    t.string   "course_price"
    t.string   "book_price"
    t.string   "image_path"
    t.text     "prereqs"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "title"
    t.string   "position"
    t.string   "avatar_file_name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "min_depth"
    t.string   "max_depth"
    t.string   "avg_depth"
    t.string   "nitrox_mix"
    t.string   "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
