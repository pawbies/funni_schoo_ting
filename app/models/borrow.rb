class Borrow < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :borrow_date, presence: true
  validates :return_date, presence: true
  # validates :returned, presence: true
  validates :firstname, presence: true, length: { maximum: 30 }
  validates :lastname, presence: true, length: { maximum: 30 }
end
