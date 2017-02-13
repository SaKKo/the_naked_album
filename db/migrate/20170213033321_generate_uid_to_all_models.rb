class GenerateUidToAllModels < ActiveRecord::Migration[5.0]
  def change
    User.all.each do |user|
      user.generate_uid
      user.save!
    end
    Album.all.each do |album|
      album.generate_uid
      album.save!
    end
    Image.all.each do |image|
      image.generate_uid
      image.save!
    end
  end
end
