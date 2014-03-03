class Image < ActiveRecord::Base
  has_many :hocr_layers
end