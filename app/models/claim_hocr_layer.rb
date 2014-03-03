class ClaimHocrLayer < ActiveRecord::Base
  belongs_to :hocr_layer
  belongs_to :claim
end