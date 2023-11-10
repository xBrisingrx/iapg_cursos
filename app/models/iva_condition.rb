class IvaCondition < ApplicationRecord
  has_many :companies

  validates :name, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["active", "name", "description","id", "id_value", "created_at", "updated_at"]
  end
end
