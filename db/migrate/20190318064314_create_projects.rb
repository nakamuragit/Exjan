class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :image_data
      t.string :company_name
      t.integer :pay
      t.string :period
      t.string :method
      t.integer :cutback
      t.string :site
      t.text :description

      t.timestamps
    end
  end
end
