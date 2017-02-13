class AddImageFileToImage < ActiveRecord::Migration[5.0]
  def up
    add_attachment :images, :image_file
  end

  def down
    remove_attachment :images, :image_file
  end
end
