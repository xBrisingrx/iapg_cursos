class CompanyCategory < ApplicationRecord
  scope :actives, -> { where(active: true)}
end
