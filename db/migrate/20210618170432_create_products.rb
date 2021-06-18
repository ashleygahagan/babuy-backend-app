class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :description
      t.string :condition
      t.integer :price
      t.boolean :trade
      t.boolean :sold

      t.timestamps
    end
  end
end
