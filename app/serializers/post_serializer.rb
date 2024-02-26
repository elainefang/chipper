class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id

  def images
    return unless object.images.attached?

    object.images.map do |image|
      {
        id: image.id,
        filename: image.filename,
        content_type: image.content_type,
        byte_size: image.byte_size,
        created_at: image.created_at,
        url: rails_blob_url(image)
      }
    end
  end


end
