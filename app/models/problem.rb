class Problem < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :title, length: { maximum: 30 }

  belongs_to :article
  belongs_to :user
end
