require 'debugger'
class HocrLayer < ActiveRecord::Base
  belongs_to :image
  has_many :hocr_lines
  has_many :claim_hocr_layers
  has_many :claims, :through => :claim_hocr_layers

 # before this method is called, need to run through hocr_files folder
 # and create hocr_layer objects with those filenames


  def self.identify_claims
    self.all.each do |hocr_layer|
      current_claim = nil
      file = File.open("./public/ocr_files/#{hocr_layer.filename}_ocr.txt", "r")
      data = file.read
      record_info = /.*\(Record\sNo.\s(\d+),\sof\s1863\.\).*/.match(data)
      if record_info
        # this is the start of a claim
        current_record = record_info[1].to_i
        current_claim = Claim.create(:record_number => current_record)
      end
      if current_claim
        hocr_layer.link_claim(current_claim)
        hocr_layer.create_claim(current_claim, data)
      end
    end
  end

  def link_claim(claim)
    # create association between hocr_layer and claim if it doesn't already exist
    if !self.claims.include? claim
      self.claims << claim
    end
    self.save
  end

  def create_claim(claim, data)
    # grab name
    claimant = /.*CLAIM\sOF\s(\w+\s+\w+)\.\W*\(Record\sNo\.\s\d+,\sof\s1863\.\).*/.match(data)
    if claimant
      claim.people << Person.create(:name => claimant[1].name_caps, :role => "claimant")
    end
    # populate claim data via regex on hocr_layer
    claim.save
  end

  def replace_bbox
    file_path = "./public/hocr_files/#{self.filename}_hocr.html"
    file = File.open(file_path, "r")
    data = file.read
    regex = /(id='word_\d+')\s(title="\w{4}\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)")/
    data = data.gsub(regex,"\\1 style='left: \\3\; top: \\4\;'")
    File.open(file_path, 'w') {|f| f.write(data) }
  end

end

class String

  def name_caps
    array = []
    self.downcase!.split(" ").map {|name| array<<name[0].upcase+name[1..-1]}
    array.join(" ")
  end

end
