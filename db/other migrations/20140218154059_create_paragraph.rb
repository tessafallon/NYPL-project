class CreateParagraph < ActiveRecord::Migration
  def change
    create_table :paragraphs do |t|
      t.belongs_to :claim
      t.string :type
      t.text :text
    end
  end
end
