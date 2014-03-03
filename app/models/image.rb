class Image < ActiveRecord::Base
  has_one :hocr_layer

  def self.create_images
    #Parse through all image files
    #Create hocr_layer associations
  end

  def self.run_ocrs(path)
    img_filenames = Dir.new(path).entries.select { |f| !File.directory? f }
    img_filenames.each do |file|
      exec "tesseract #{file}.tif ../ocr_files/#{file}_ocr -l eng"
      exec "tesseract #{file}.tif ../hocr_files/#{file}_hocr -l eng -hocr"
    end
   
  end
end