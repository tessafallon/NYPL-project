class Claim < ActiveRecord::Base
  attr_accessible :claim_date, :incident_date, :resolution_date, :claim_number, :record_number, :incident_address, :incident_address_type, :total_claimed, :total_awarded

  validates :incident_address_type,
    :inclusion => { :in => ["Home", "Workplace", "Other"],
    :message => "%{value} is not one of the stated options of home, workplace, or other."}

end