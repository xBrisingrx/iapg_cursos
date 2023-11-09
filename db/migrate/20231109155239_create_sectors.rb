class CreateSectors < ActiveRecord::Migration[7.1]
  def change
    create_table :sectors do |t|
      t.string :name, null:false
      t.string :description
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
