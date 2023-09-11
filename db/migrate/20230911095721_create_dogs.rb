class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name, unique: true
      t.integer :good_with_children
      t.integer :good_with_other_dogs
      t.integer :shedding
      t.integer :grooming
      t.integer :drooling
      t.integer :coat_length
      t.integer :good_with_strangers
      t.integer :playfulness
      t.integer :protectiveness
      t.integer :trainability
      t.integer :energy
      t.integer :barking
      t.float :min_life_expectancy
      t.float :max_life_expectancy
      t.float :max_height_male
      t.float :max_height_female
      t.float :max_weight_male
      t.float :max_weight_female
      t.float :min_height_male
      t.float :min_height_female
      t.float :min_weight_male
      t.float :min_weight_female

      t.timestamps
    end
  end
end
