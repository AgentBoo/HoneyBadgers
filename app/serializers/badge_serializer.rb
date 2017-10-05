class BadgeSerializer < ActiveModel::Serializer
  attributes :id, :product, :price, :size, :year, :description, :category, :available, :image_path

  def image
    Refile.attachment_url(object, :image, :fill, 800, 800, format: "png")
  end

  def image_path
    url = "https://murmuring-scrubland-72784.herokuapp.com"
    url + image.to_s
  end
end
