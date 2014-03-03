class Image < ActiveRecord::Base
  has_one :hocr_layer

  def self.create_images
    #Parse through all image files
    #Create hocr_layer associations
  end
end