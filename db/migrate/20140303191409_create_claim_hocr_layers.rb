class CreateClaimHocrLayers < ActiveRecord::Migration
  def change
    create_table :claim_hocr_layers do |t|
      t.integer :claim_id
      t.integer :hocr_layer_id
    end
  end
end
