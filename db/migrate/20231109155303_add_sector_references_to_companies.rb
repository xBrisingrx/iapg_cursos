class AddSectorReferencesToCompanies < ActiveRecord::Migration[7.1]
  def change
    add_reference :companies, :sector, null: false, foreign_key: true
  end
end
