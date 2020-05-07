# == Schema Information
#
# Table name: problems
#
#  id         :bigint           not null, primary key
#  answer     :text(65535)
#  body       :text(65535)      not null
#  link       :string(255)
#  title      :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_problems_on_article_id  (article_id)
#  index_problems_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (article_id => articles.id)
#  fk_rails_...  (user_id => users.id)
#
class Problem < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :title, length: { maximum: 30 }

  belongs_to :article
  belongs_to :user
end
