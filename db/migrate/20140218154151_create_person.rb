class CreatePerson < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :previous_address
      t.string :current_address
      t.string :role
      t.string :gender
      t.string :race
      t.integer :claim_id
    end
  end
end
