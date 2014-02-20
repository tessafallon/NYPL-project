class CreateParagraphPerson < ActiveRecord::Migration
  def change
    create_table :paragraph_people do |t|
      t.belongs_to :paragraph
      t.belongs_to :person
    end
  end
end
