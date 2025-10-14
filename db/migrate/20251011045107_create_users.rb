class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, index: { unique: true }
      t.string :password_digest, null: false
      t.string :name
      t.string :postal_code
      t.string :address
      t.string :building
      t.string :image
      t.timestamps
    end
  end
end
