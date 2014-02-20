class Person < ActiveRecord::Base
  # attr_accessible :name, :previous_address, :current_address, :role, :gender, :race

  belongs_to :claim

  validates :role,
    :inclusion => { :in => ["claimant", "witness", "attorney", "advocate", "other", "", nil],
    :message => "%{value} is not one of the stated options.  Did you mean 'other'?"}

end