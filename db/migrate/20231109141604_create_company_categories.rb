class CreateCompanyCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :company_categories do |t|
      t.string :name, null:false
      t.integer :quota, null:false, default: 0
      t.boolean :is_partner, null:false
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
