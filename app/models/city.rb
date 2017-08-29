class City < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  validates :slug, presence: true, slug: true, if: :slug_changed?
end
