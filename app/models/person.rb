class Person < ActiveRecord::Base
  attr_accessible :name, :previous_address, :current_address, :role, :gender, :race

  validates :role,
    :inclusion => { :in => ["Claimant", "Witness", "Attorney", "Advocate", "Other"],
    :message => "%{value} is not one of the stated options.  Did you mean 'other'?"}

end