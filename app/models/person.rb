class Person < ActiveRecord::Base
  # attr_accessible :name, :previous_address, :current_address, :role, :gender, :race

  belongs_to :claim

  validates :role,
    :inclusion => { :in => ["Claimant", "Witness", "Attorney", "Advocate", "Other", "", nil],
    :message => "%{value} is not one of the stated options.  Did you mean 'other'?"}

end