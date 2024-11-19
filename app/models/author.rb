class Author < ApplicationRecord
  has_and_belongs_to_many :books

  validates :firstname, length: { maximum: 30 }
  validates :lastname, length: { maximum: 30 }
  validates :artist_name, length: { maximum: 30 }

  def display_name
    name = ""
    name += self.firstname if self.firstname.present?
    name += " #{self.lastname}" if self.firstname.present?
    name += " (#{self.artist_name})" if self.artist_name.present?

    name = "Kein Name" if name.empty?

    name
  end
end
