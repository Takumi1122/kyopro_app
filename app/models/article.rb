# == Schema Information
#
# Table name: articles
#
#  id          :bigint           not null, primary key
#  body        :text(65535)      not null
#  title       :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_articles_on_category_id  (category_id)
#  index_articles_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#
class Article < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :title, length: { maximum: 30 }

  belongs_to :user
  belongs_to :category
  has_many :problems
end
