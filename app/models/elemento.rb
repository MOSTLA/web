class Elemento < ApplicationRecord
  mount_uploader :foto, PictureUploader
end
