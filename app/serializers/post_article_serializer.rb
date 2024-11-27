class PostArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id, :content, :created_at, :updated_at
end
