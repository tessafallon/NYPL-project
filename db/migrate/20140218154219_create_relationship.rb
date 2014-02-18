class CreateRelationship < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :person
      t.belongs_to :associate, :class_name => 'person'
      t.string :description
    end
  end
end
