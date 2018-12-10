class Ppt < ApplicationRecord
  mount_uploader :imagen, PictureUploader
  validates :posicion, uniqueness: {
    scope: :tema_id, message: ", Solo puede haber una imagen en una posición"
  }
end
