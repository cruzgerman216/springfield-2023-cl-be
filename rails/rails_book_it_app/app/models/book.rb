class Book < ApplicationRecord
  validates :title, :summary, presence: true

  has_and_belongs_to_many :categories
  has_many :reviews
end
