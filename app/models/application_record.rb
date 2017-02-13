class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  validates :uid, presence: true

  # before_create :generate_uid
  # before_save :generate_uid
  # after_initialize :generate_uid
  
  before_validation :generate_uid, on: :create

  def generate_uid
    self.uid = SecureRandom.urlsafe_base64(10)
  end
end
