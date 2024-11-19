class Book < ApplicationRecord
  belongs_to :publisher
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :authors

  has_many :borrows, dependent: :destroy
  has_many :users, through: :borrows

  validates :name, presence: true
  validates :description, length: { maximum: 500 }
  validates :amount, inclusion: 0..1000
  validates :publisher, presence: true

  def effective_amount
    self.amount - self.borrows.count
  end
end
