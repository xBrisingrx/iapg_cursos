class Company < ApplicationRecord
  belongs_to :iva_condition
  belongs_to :company_category
  belongs_to :province
  belongs_to :city
end
