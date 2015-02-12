class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.integer :phone
      t.integer :capacity
      t.text :summary

      t.timestamps null: false
    end
  end
end
