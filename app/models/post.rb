class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many_attached :images, dependent: :destroy

    scope :with_comments, -> { left_joins(:comments).select('posts.*, COUNT(comments.id) AS comment_count').group('posts.id') }
end
