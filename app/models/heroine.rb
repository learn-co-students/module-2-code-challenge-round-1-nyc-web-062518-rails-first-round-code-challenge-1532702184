class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true

  def power_name=(name)
    power = Power.find_or_create_by(name: name)
    self.power = power
  end

  def power_name
    self.try(:power).try(:name)
  end
end
