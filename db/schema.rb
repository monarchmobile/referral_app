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

ActiveRecord::Schema.define(:version => 20130224171559) do

  create_table "addresses", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "affiliations", :force => true do |t|
    t.string   "aff_name"
    t.string   "chapter"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "biz_types", :force => true do |t|
    t.string   "category"
    t.integer  "code"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "associate_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "emails", :force => true do |t|
    t.string   "email"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "emails", ["user_id"], :name => "index_emails_on_user_id"

  create_table "leads", :force => true do |t|
    t.integer  "referrer_id"
    t.integer  "referee_id"
    t.integer  "referral_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "target_id"
  end

  create_table "notes", :force => true do |t|
    t.string   "written_note"
    t.integer  "referral_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.boolean  "t_card_given"
    t.text     "t_comments"
    t.string   "t_preferred_contact"
    t.date     "contact_by"
    t.date     "warm_up_by"
    t.date     "r_contact_by"
    t.text     "r_comments"
    t.boolean  "r_card_given"
    t.string   "r_preferred_contact"
    t.string   "t_urgency"
    t.string   "r_urgency"
  end

  create_table "phone_numbers", :force => true do |t|
    t.string   "number"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "phone_type"
  end

  create_table "referrals", :force => true do |t|
    t.string   "urgency"
    t.date     "date_submitted"
    t.boolean  "inside"
    t.boolean  "card_given"
    t.string   "preferred_contact"
    t.text     "comments"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.date     "contact_by"
    t.date     "warm_up_by"
  end

  create_table "social_networks", :force => true do |t|
    t.string   "network_name"
    t.string   "acct_name"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "biz_type"
    t.string   "website"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.integer  "biz_type_id"
    t.boolean  "guest"
  end

end
