class CreateHocrLayers < ActiveRecord::Migration
  def change
    create_table :hocr_layers do |t|
      t.string :filename
      t.integer :image_id
    end
  end
end
