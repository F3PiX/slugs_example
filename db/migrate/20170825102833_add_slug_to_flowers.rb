class AddSlugToFlowers < ActiveRecord::Migration[5.1]
  def change
    add_column :flowers, :slug, :string
    add_index :flowers, :slug, unique: true
  end
end
