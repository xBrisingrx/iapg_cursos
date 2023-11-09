class Company < ApplicationRecord
  belongs_to :iva_condition
  belongs_to :company_category
  belongs_to :province
  belongs_to :city
  belongs_to :sector

  scope :actives, -> { where(active: true)}

  def self.ransackable_attributes(auth_object = nil)
    ["active", "name", "cuit", "sector_id", "iva_condition_id", "company_category_id", "province_id", 
      "city_id", "direction", "id", "id_value", "phone","created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["city", "province", "iva_condition", "sector", "company_category"]
  end

  def disable
    self.update( active: false )
  end

  def fullname
    "#{self.last_name} #{self.name}"
  end
  private
  def set_province
    province = Province.find(self.city.province.id)
    self.province = province
  end
end