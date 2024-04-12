class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many_attached :images, dependent: :destroy

    validate :acceptable_images

    scope :with_comments, -> { left_joins(:comments).select('posts.*, COUNT(comments.id) AS comment_count').group('posts.id') }

    def acceptable_images
      return unless images.attached?

    	images.each do |image|
				unless image.byte_size <= 2.megabyte
					errors.add(:images, 'too large')
				end

				acceptable_types = ["image/jpeg", "image/png"]
				unless acceptable_types.include?(main_image.content_type)
					errors.add(:images, "must be a JPEG or PNG")
				end
			end
			unless images.size > 10
				errors.add(:images, 'too many images')
			end
    end
end
