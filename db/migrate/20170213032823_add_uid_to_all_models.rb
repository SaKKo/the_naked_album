class AddUidToAllModels < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :uid, :text
    add_index :users, :uid, unique: true

    add_column :albums, :uid, :text
    add_index :albums, :uid, :unique => true

    add_column :images, :uid, :text
    add_index :images, :uid, :unique => true
  end
end
