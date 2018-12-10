class Articulo < ApplicationRecord
  mount_uploader :imagen, PictureUploader
  VALID_Mat_REGEX = /A[0-9]{8}/
  validates :ultimoPedido, format: { with: VALID_Mat_REGEX }, :if => :ultimoPedido
end
