class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :price
      t.timestamp :created
      t.timestamp :updated
      t.timestamps
    end
  end
end
