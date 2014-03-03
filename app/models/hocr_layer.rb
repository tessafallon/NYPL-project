class HocrLayer < ActiveRecord::Base
  belongs_to :image
  has_many :hocr_lines
  has_many :claim_horc_layers
  has_many :claims, :through => :claim_horc_layers
end