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

ActiveRecord::Schema[7.0].define(version: 2023_09_11_095721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dogs", force: :cascade do |t|
    t.string "name"
    t.integer "good_with_children"
    t.integer "good_with_other_dogs"
    t.integer "shedding"
    t.integer "grooming"
    t.integer "drooling"
    t.integer "coat_length"
    t.integer "good_with_strangers"
    t.integer "playfulness"
    t.integer "protectiveness"
    t.integer "trainability"
    t.integer "energy"
    t.integer "barking"
    t.float "min_life_expectancy"
    t.float "max_life_expectancy"
    t.float "max_height_male"
    t.float "max_height_female"
    t.float "max_weight_male"
    t.float "max_weight_female"
    t.float "min_height_male"
    t.float "min_height_female"
    t.float "min_weight_male"
    t.float "min_weight_female"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
