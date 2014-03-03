class AddPageNumberColumnToImages < ActiveRecord::Migration
  def change
    add_column :images, :page_number, :integer
  end
end
