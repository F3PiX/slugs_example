class CreateFlowers < ActiveRecord::Migration[5.1]
  def change
    create_table :flowers do |t|
      t.string :title
      t.string :colour

      t.timestamps
    end
  end
end
