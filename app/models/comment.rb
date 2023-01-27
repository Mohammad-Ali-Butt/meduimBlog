class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: 'User', foreign_key: 'commenter_id'
  validates :body, presence: :true
  has_many :comments, as: :commentable, class_name: 'Comment', dependent: :destroy
  has_many :likes, as: :likeable
end
