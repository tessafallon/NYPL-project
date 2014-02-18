class CreateExaminer < ActiveRecord::Migration
  def change
    create_table :examiners do |t|
      t.string :name
    end
  end
end
