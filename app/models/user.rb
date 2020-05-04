class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :articles, dependent: :destroy
  has_many :problems, dependent: :destroy

end
