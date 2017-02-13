# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uid        :text
#

class Album < ApplicationRecord
  
  belongs_to :user
  has_many :images

end
