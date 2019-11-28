class User < ApplicationRecord
  attr_accessor :remember_digest
  
  before_create :create_remember_token
  before_save { email.downcase! }

  validates :name, presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }


  class << self
      # Returns a random token.
    def new_token
    SecureRandom.urlsafe_base64
    end

    def digest_method(token)
      Digest::SHA1.hexdigest(token.to_s)
    end
  end


  private

  def create_remember_token
    self.remember_digest = User.digest_method(User.new_token)
  end
end
