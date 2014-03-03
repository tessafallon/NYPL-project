require 'debugger'

class HocrLayer < ActiveRecord::Base
  belongs_to :image
  has_many :hocr_lines
  has_many :claim_hocr_layers
  has_many :claims, :through => :claim_hocr_layers

  def self.identify_claims
    self.all.each do |hocr_layer|
      file = File.open("./public/ocr_files/#{hocr_layer.filename}_ocr.txt", "r")
      data = file.read
      if /.*\(Record\sNo.\s(\d+),\sof\s1863\.\).*/.match(data)
        # this is the start of a claim
        record_info = /.*\(Record\sNo.\s(\d+),\sof\s1863\.\).*/.match(data)
        current_record = record_info[1].to_i
        current_claim = Claim.create(:record_number => current_record)
      end
    end
  end

  def create_claim

  end

end