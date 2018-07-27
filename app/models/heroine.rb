class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true

  # BONUS Search query function -----
  # Right now just trying to get the search function working
  # with the name or super hero name, or power_id
  # then will move to trying to search by power name
  def self.search(search)
    where("name LIKE ? OR super_name LIKE ? OR power_id LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
