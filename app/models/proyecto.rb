class Proyecto < ApplicationRecord
  mount_uploader :imagen, PictureUploader
end
