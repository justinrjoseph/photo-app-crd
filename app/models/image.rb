class Image < ActiveRecord::Base
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :picture_size
  
  private
  
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "must be less than 5MB")
      end
    end
end
