# == Schema Information
#
# Table name: post_articles
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_post_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class PostArticle < ApplicationRecord
  belongs_to :user

  def self.ransackable_attributes(_auth_object = nil)
    %w[id title content created_at updated_at user_id]
  end
end
