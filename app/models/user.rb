class User < ApplicationRecord
  has_secure_password

  has_many :borrows, dependent: :destroy
  has_many :books, through: :borrows

  validates :firstname, presence: true, length: { maximum: 30 }
  validates :lastname, presence: true, length: { maximum: 30 }
  validates :username, presence: true, length: { maximum: 20 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 8 }, if: :password_changed?

  private

  def password_changed?
    password.present? || new_record?
  end
end
