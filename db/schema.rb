# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_09_15_080212) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allowedlists", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "answerresponders", force: :cascade do |t|
    t.bigint "answer_id", null: false
    t.bigint "responder_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_answerresponders_on_answer_id"
    t.index ["responder_id"], name: "index_answerresponders_on_responder_id"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.bigint "option_id"
    t.string "text"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["option_id"], name: "index_answers_on_option_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_employments_on_company_id"
    t.index ["user_id"], name: "index_employments_on_user_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.bigint "research_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["research_id"], name: "index_inquiries_on_research_id"
  end

  create_table "options", force: :cascade do |t|
    t.bigint "question_id", null: false
    t.boolean "correct", default: false
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "inquiry_id", null: false
    t.string "body", null: false
    t.boolean "optional", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inquiry_id"], name: "index_questions_on_inquiry_id"
  end

  create_table "researchcompanies", force: :cascade do |t|
    t.bigint "research_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_researchcompanies_on_company_id"
    t.index ["research_id"], name: "index_researchcompanies_on_research_id"
  end

  create_table "researches", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responders", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "answerresponders", "answers"
  add_foreign_key "answerresponders", "responders"
  add_foreign_key "answers", "options"
  add_foreign_key "answers", "questions"
  add_foreign_key "employments", "companies"
  add_foreign_key "employments", "users"
  add_foreign_key "inquiries", "researches"
  add_foreign_key "options", "questions"
  add_foreign_key "questions", "inquiries"
  add_foreign_key "researchcompanies", "companies"
  add_foreign_key "researchcompanies", "researches"
end
