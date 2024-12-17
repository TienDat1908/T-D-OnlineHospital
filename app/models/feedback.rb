# == Schema Information
#
# Table name: feedbacks
#
#  id          :bigint           not null, primary key
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_feedbacks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Feedback < ApplicationRecord
  has_many_attached :images

  belongs_to :user

  validates :description, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    %w[id description created_at updated_at]
  end
end
