class Book < ApplicationRecord
  has_many :authors, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :publisher, presence: true, length: { minimum: 5 }
  
end
