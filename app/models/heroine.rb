class Heroine < ApplicationRecord
  belongs_to :power

  validates :name, :super_name, presence: true
  validates :super_name, uniqueness: { case_sensitive: false }
end
