class Examiner < ActiveRecord::Base
  # attr_accessible :name

  has_many :claim_examiners
  has_many :claims, :through => :claim_examiners
end