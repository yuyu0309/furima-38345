class CreatePurchaseInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_infos do |t|
      t.string  :post_code, null: false
      t.integer :prefecture_id, null: false
      t.string  :municipality, null: false
      t.string  :address, null: false
      t.string  :building_name
      t.string  :phone_number, null: false
      t.references :purchase_management, null: false, foreign_key: true
      t.timestamps
    end
  end
end
