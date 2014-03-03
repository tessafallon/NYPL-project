class HocrLayer < ActiveRecord::Base
  belongs_to :image
  has_many :hocr_lines
  has_many :claim_hocr_layers
  has_many :claims, :through => :claim_hocr_layers

  def claim_association
    file = File.open(self.filename)

  end

end