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
class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :description, :images_url, :user_id, :created_at, :updated_at

  def images_url
    return unless object.images.attached?

    object.images.map do |image|
      Rails.application.routes.url_helpers.url_for(image)
    end
  end
end
