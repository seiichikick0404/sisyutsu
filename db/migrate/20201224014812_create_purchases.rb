class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string    :text, null: false
      t.integer   :category_id, null: false
      t.integer   :price, null: false
      t.timestamps
    end
  end
end
