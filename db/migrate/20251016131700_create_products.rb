class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.references :status, foreign_key: true
      t.string :name
      t.text :detail
      t.integer :price
      t.timestamps
    end
  end
end
