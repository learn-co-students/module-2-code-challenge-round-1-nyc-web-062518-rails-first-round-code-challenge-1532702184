class Heroine < ApplicationRecord
  belongs_to :power

  validates(:super_name, uniqueness: true)

  def powers
    Power.all.each do |power|
      power.name
    end
  end
end
