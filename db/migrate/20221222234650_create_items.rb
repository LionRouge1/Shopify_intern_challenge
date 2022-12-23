class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :item_name
      t.string :category
      t.date :expire_at

      t.timestamps
    end
  end
end
