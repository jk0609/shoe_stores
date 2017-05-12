class ChangePrice < ActiveRecord::Migration[5.1]
  def change
    remove_column(:brands, :price, :float)
    add_column(:brands, :price, :string)
  end
end
