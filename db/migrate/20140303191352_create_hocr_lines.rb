class CreateHocrLines < ActiveRecord::Migration
  def change
    create_table :hocr_lines do |t|
      t.float :x_position
      t.float :y_position
      t.float :height
      t.float :width
      t.text :text
      t.integer :hocr_layer_id
    end
  end
end
