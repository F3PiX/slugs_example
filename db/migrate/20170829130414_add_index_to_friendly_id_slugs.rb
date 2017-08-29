class AddIndexToFriendlyIdSlugs < ActiveRecord::Migration[5.1]
  def change
    add_index :friendly_id_slugs, :slug, unique: true
  end
end
