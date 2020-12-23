class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :title,        null:false
      t.text       :information 
      t.integer    :category_id, null:false
      t.string     :brand
      t.references :user,        foreign_key: true

      t.timestamps
    end
  end
end
