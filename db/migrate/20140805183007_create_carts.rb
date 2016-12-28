class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.string :status, default: nil
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
