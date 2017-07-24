class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :auth_token, uniqueness: true
  before_save :generate_auth_token
  has_many :posts
  private
  def generate_auth_token
    if self.auth_token.blank?
      self.auth_token = Digest::SHA1.hexdigest([Time.now, rand].join).first(30)
    end
  end
end
