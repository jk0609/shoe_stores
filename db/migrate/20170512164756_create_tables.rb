class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:stores) do |t|
      t.column(:name, :string)
    end
    create_table(:brands) do |t|
      t.column(:name, :string)
      t.column(:price, :float)
    end
    create_table(:shoes) do |t|
      t.column(:brand_id, :integer)
      t.column(:store_id, :integer)
    end
  end
end
