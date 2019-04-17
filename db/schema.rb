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

ActiveRecord::Schema.define(version: 2019_04_17_030744) do

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_courses", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "course_id", null: false
    t.index ["category_id", "course_id"], name: "index_categories_courses_on_category_id_and_course_id"
  end

  create_table "course_orders", force: :cascade do |t|
    t.integer "course_id"
    t.integer "order_id"
    t.integer "final_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_orders_on_course_id"
    t.index ["order_id"], name: "index_course_orders_on_order_id"
  end

  create_table "course_ratings", force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
    t.integer "rate"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_ratings_on_course_id"
    t.index ["student_id"], name: "index_course_ratings_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "syllabus"
    t.decimal "price"
    t.integer "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["teacher_id"], name: "index_courses_on_teacher_id"
  end

  create_table "courses_purchases", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "purchase_id", null: false
    t.index ["course_id", "purchase_id"], name: "index_courses_purchases_on_course_id_and_purchase_id"
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.index ["course_id", "student_id"], name: "index_courses_students_on_course_id_and_student_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "situation"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_orders_on_student_id"
  end

  create_table "purchases", force: :cascade do |t|
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_purchases_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teacher_ratings", force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "student_id"
    t.integer "rate"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_teacher_ratings_on_student_id"
    t.index ["teacher_id"], name: "index_teacher_ratings_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "phone_number"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_teachers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.date "birthdate", null: false
    t.string "cpf", null: false
    t.integer "gender", null: false
    t.string "name", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wishes", force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_wishes_on_course_id"
    t.index ["student_id"], name: "index_wishes_on_student_id"
  end

end
