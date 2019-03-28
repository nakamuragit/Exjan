class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :image_data
      t.string :company_name, null: false
      t.integer :pay, null: false
      t.string :period, null: false
      t.string :method, null: false
      t.integer :cutback, null: false
      t.string :site, null: false
      t.text :description, null: false
      
      t.timestamps
    end
  end
end
