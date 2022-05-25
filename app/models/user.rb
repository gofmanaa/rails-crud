class User < ApplicationRecord
  attr_accessor :password_confirmation

  before_save { email.downcase! }
  before_save :save_password

  has_secure_password

  validates :username, presence: true, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true,
                    format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: 'Invalid email' }
  validates :password, presence: true, confirmation: true, length: { minimum: 3 }
  validates_confirmation_of :password
  validates_presence_of :password_confirmation, if: :password_changed?

  private

  def save_password
    if attributes['password_digest'].present? && psw != attributes['password_digest']
      self.psw = attributes['password_digest']
    end
  end

end
