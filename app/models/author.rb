class Author < ApplicationRecord
  belongs_to :book, inverse_of: :authors

  validates :name, presence: true, length: { minimum: 5 }

end
