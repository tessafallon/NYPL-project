class CreateClaimExaminer < ActiveRecord::Migration
  def change
    create_table :claim_examiners do |t|
      t.integer :claim_id
      t.integer :examiner_id
    end
  end
end
