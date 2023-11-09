class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false, limit:100
      t.bigint :cuit, null: false, limit:30
      t.string :direction, limit:100
      t.string :phone, limit: 40
      t.string :contract
      t.boolean :operator,null:false,default: false
      t.string :comment
      t.references :iva_condition, null: false, foreign_key: true
      t.references :company_category, null: false, foreign_key: true
      t.references :province, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
