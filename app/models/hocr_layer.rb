require 'debugger'

class HocrLayer < ActiveRecord::Base
  belongs_to :image
  has_many :hocr_lines
  has_many :claim_hocr_layers
  has_many :claims, :through => :claim_hocr_layers

  def identify_claim
    debugger
    file = File.open("./public/hocr_files/#{self.filename}.html", "r")
    puts "hi"
  end

end