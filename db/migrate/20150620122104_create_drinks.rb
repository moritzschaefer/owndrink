class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :title
      t.string :flavor_base
      t.string :e_numbers
      t.boolean :stevia
      t.integer :bottle_type
      t.string :alcohol_type
      t.string :energy_type
      t.string :img_ref
      t.integer :blubber
      t.integer :required_amount
      t.float :price_idea

      t.timestamps null: false
    end
  end
end
