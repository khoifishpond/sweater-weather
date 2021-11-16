class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  has_secure_password
  before_create :api_key_gen

  def api_key_gen
    self.api_key = SecureRandom.base64.tr('+/-', 'Qrt')
  end
end
