class Micropost < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: Settings.max_length}
  validate :picture_size
  scope :order_desc, ->{order created_at: :desc}

  private

  def picture_size
    return unless picture.size > Settings.max_size_img.megabytes
    errors.add :picture, I18n.t("error_size")
  end
end
