class AddAddressToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :address, :text
  end
end
