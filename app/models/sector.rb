class Sector < ApplicationRecord
  scope :actives, -> { where(active: true)}
end
