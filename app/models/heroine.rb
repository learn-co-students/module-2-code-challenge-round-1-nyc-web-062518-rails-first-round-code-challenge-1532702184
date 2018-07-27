class Heroine < ApplicationRecord

  has_many :heroinepowers
  has_one :powers

  validates :super_name, uniqueness: true

end
