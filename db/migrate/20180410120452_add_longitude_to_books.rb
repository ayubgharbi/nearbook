class AddLongitudeToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :longitude, :float
  end
end
