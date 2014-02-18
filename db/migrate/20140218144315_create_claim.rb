class CreateClaim < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.belongs_to :person
      t.date :claim_date
      t.date :incident_date
      t.date :resolution_date
      t.integer :claim_number
      t.integer :record_number
      t.string :incident_address
      t.string :incident_address_type
      t.float :total_claimed
      t.float :total_awarded
      t.belongs_to :examiner
    end
  end
end

