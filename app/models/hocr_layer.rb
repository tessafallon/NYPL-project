require 'debugger'

class HocrLayer < ActiveRecord::Base
  belongs_to :image
  has_many :hocr_lines
  has_many :claim_hocr_layers
  has_many :claims, :through => :claim_hocr_layers

  def identify_claim
    file = File.open("./public/ocr_files/#{self.filename}_ocr.txt", "r")
    data = file.read
    if /.*\(Record\sNo.\s(\d+),\sof\s1863\.\).*/.match(data)
      record_info = /.*\(Record\sNo.\s(\d+),\sof\s1863\.\).*/.match(data)
      debugger
      record_number = record_info[1].to_i
    end
  end

end