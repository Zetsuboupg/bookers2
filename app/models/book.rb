class Book < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  validates :body, length: { maximum: 200 }
  validates :title, presence: true
  validates :body, presence: true


  def get_image
    if image.attached?
      Rails.application.routes.url_helpers.rails_blob_path(image, only_path: true)
    else
      'default_image.png' # デフォルトの画像パス
    end
  end


end
