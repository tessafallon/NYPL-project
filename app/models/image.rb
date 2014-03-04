class Image < ActiveRecord::Base
  has_one :hocr_layer

  def self.create_images
    #Parse through all image files
    #Create hocr_layer associations
  end

  def self.run_ocrs(path)
    img_filenames = Dir.new(path).entries.select do |f|
      !File.directory?(f) && !f.start_with?(".")
    end
    img_filenames.each do |file|
      system "tesseract #{File.join(path, file)} #{Rails.public_path}/ocr_files/#{file[0..-5]}_ocr -l eng"
      system "tesseract #{File.join(path, file)} #{Rails.public_path}/hocr_files/#{file[0..-5]}_hocr -l eng hocr"
    end
  end

end