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
        hocr_layer.create_claim(current_claim, data)
      end
    end
  end

  def create_claim(claim, data)
    # grab name
    claimant = /.*CLAIM\sOF\s(\w+\s+\w+)\.\W*\(Record\sNo\.\s\d+,\sof\s1863\.\).*/.match(data)
    if claimant
      claim.people << Person.create(:name => claimant[1].name_caps, :role => "claimant")
    end
    # create association between hocr_layer and claim
    # populate claim data via regex on hocr_layer
  end

end

class String

  def name_caps
    array = []
    self.downcase!.split(" ").map {|name| array<<name[0].upcase+name[1..-1]}
    array.join(" ")
  end

end
