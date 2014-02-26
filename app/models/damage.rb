class Damage < ActiveRecord::Base
  # attr_accessible :description, :quantity, :unit, :total_cost, :overcharge?
  belongs_to :claim
end