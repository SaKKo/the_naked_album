# == Schema Information
#
# Table name: images
#
#  id                      :integer          not null, primary key
#  name                    :text
#  description             :text
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  image_file_file_name    :string
#  image_file_content_type :string
#  image_file_file_size    :integer
#  image_file_updated_at   :datetime
#

class Image < ApplicationRecord
  has_attached_file :image_file, styles: {large: "1024x1024>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image_file, content_type: /\Aimage\/.*\z/
end
