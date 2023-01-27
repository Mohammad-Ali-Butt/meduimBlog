class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, as: :commentable
    validates :title, presence: true
    validates :body, presence: true, length: { minimum: 10 }
    has_many :likes, as: :likeable
    has_one_attached :avatar
end
