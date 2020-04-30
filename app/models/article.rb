class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :title, length: { maximum: 30 }

  belongs_to :user
  belongs_to :category
end
