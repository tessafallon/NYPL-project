class CreateDamage < ActiveRecord::Migration
  def change
    create_table :damages do |t|
      t.string :description
      t.integer :quantity
      t.string :unit
      t.float :total_cost
      t.boolean :overcharge?
      t.belongs_to :claim
    end
  end
end
