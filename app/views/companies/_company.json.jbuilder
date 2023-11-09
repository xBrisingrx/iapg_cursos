json.extract! company, :id, :name, :cuit, :direction, :phone, :contract, :operator, :comment, :iva_condition_id, :company_category_id, :province_id, :city_id, :created_at, :updated_at
json.url company_url(company, format: :json)
