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

ActiveRecord::Schema.define(version: 2019_05_18_202430) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "course_orders", force: :cascade do |t|
    t.integer "course_id"
    t.integer "order_id"
    t.decimal "final_price"
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

  create_table "course_trails", force: :cascade do |t|
    t.integer "course_id"
    t.integer "trail_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_trails_on_course_id"
    t.index ["trail_id"], name: "index_course_trails_on_trail_id"
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

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.index ["course_id", "student_id"], name: "index_courses_students_on_course_id_and_student_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "title"
    t.integer "discount"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.integer "followable_id", null: false
    t.string "follower_type", null: false
    t.integer "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id"
  end

  create_table "lesson_students", force: :cascade do |t|
    t.boolean "watched"
    t.integer "student_id"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_lesson_students_on_lesson_id"
    t.index ["student_id"], name: "index_lesson_students_on_student_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "video_url"
    t.integer "position"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_lessons_on_course_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.boolean "read", default: false
    t.integer "student_id"
    t.integer "course_id"
    t.integer "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_notifications_on_course_id"
    t.index ["lesson_id"], name: "index_notifications_on_lesson_id"
    t.index ["student_id"], name: "index_notifications_on_student_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "situation"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_orders_on_student_id"
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

  create_table "trails", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.date "birthdate", null: false
    t.string "cpf", null: false
    t.integer "gender", null: false
    t.string "name", null: false
    t.boolean "admin", default: false
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
