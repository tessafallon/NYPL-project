  class Claim < ActiveRecord::Base
  # attr_accessible :claim_date, :incident_date, :resolution_date, :claim_number, :record_number, :incident_address, :incident_address_type, :total_claimed, :total_awarded

  has_many :people
  # has_many :claim_examiners
  # has_many :examiners, :through => :claim_examiners


  validates :incident_address_type,
    :inclusion => { :in => ["Home", "Workplace", "Other", "", nil],
    :message => "%{value} is not one of the stated options of home, workplace, or other."}

  def claimants
    Person.where(:claim_id=>self.id, :role=>"claimant")
  end

  def claimant_attr(attribute)
    self.claimants.first.send(attribute.to_sym) if self.claimants.length > 0
  end

end