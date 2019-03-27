class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :business, null: false
      t.text :reason, null: false
      t.text :other
      
      t.timestamps
    end
  end
end
